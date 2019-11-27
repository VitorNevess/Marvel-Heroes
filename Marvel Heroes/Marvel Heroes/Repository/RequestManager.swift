//
//  RequestManager.swift
//  Marvel Heroes
//
//  Created by joao.vitor.f.naves on 26/11/19.
//  Copyright © 2019 vitor.neves. All rights reserved.
//

import Alamofire

class RequestManager {
    
    //MARK: - Properties
    private static var instance = RequestManager()
    
    //MARK: - Singleton
    private init(){}
    
    public class var shared: RequestManager {
        return instance
    }
    
    //MARK: - GET
    public func get<T:Codable>(_ url: String, model: T.Type, headers: HTTPHeaders = [:], completion: @escaping (T?) -> Void, onFailure: @escaping (Error) -> Void ) {
        
        guard let _ = NetworkReachabilityManager()?.isReachable else{
            let error = NSError.init(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey : "Dispositivo sem internet"])
            onFailure(error)
            return
        }
        
        var h = headers
        if let bundleVersion = Bundle.main.infoDictionary?[APIAuthentication.HTTPHeaderField.CFBundleShortVersionString] as? String {
            h[APIAuthentication.HTTPHeaderField.VersionUser] = bundleVersion
        }
        
        Alamofire.request(url + "&" + APIAuthentication.Credentials).validate().responseJSON { response in
            
            switch response.result {
            case .success:
                do {
                    if let data = response.data, let _ = String(data: data, encoding: .utf8) {
                        let JSONString = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                        let json = try JSONDecoder().decode(model.self, from: data)
                        completion(json)
                    } else {
                        completion(nil)
                    }
                } catch {
                    onFailure(error)
                }
            case .failure(let error):
                print("URL: \(url)&\(APIAuthentication.Credentials)")
                onFailure(error)
            }
        }
    }
}
