//
//  APIAuthentication.swift
//  Marvel Heroes
//
//  Created by joao.vitor.f.naves on 26/11/19.
//  Copyright © 2019 vitor.neves. All rights reserved.
//

import Foundation
import SwiftHash

class APIAuthentication {
    
    //MARK: - Properties
    private static var instance = APIAuthentication()
    private static let BaseURL = "http://gateway.marvel.com/v1"
    private static let privateKey = "2aeaf542fc2445fecbae349aeff94251b009860d"
    private static let publicKey = "10e9c85f6eb92f930e1bf5c0ba3ba503"
    private static let limit = 10
    
    static var APIEndPoint : String {
        get {
            let value = "\(BaseURL)/public"
            return value
        }
    }
    
    static var Credentials : String {
        get {
            return getCredentials()
        }
    }
    
    //MARK: - Header
    struct HTTPHeaderField {
        static let AplicationJSON = "application/json"
        static let ContentType = "Content-Type"
        static let VersionUser = "VersionUser"
        static let CFBundleShortVersionString = "CFBundleShortVersionString"
    }
    
    private class func getCredentials() -> String {
        let ts = String(Date().timeIntervalSince1970)
        let hash = MD5(ts + privateKey + publicKey).lowercased()
        return "ts=\(ts)&apikey=\(publicKey)&hash=\(hash)"
    }
}
