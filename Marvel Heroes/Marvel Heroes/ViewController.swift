//
//  ViewController.swift
//  Marvel Heroes
//
//  Created by joao.vitor.f.naves on 15/11/19.
//  Copyright © 2019 vitor.neves. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func actionAPI() {
        var parameters : [String: Any]
        parameters = ["name": "",
                      "nameStartsWith": "",
                      "limit": 1,
                      "offset": 1]
        
        let url = "\(APIAuthentication.APIEndPoint)/characters?limit=\(parameters["limit"]!)&offset=\(parameters["offset"]!)"
        
        RequestManager.shared.get(url, model: MarvelResponse.self, completion: { (response) in
            print(response?.data?.results?.first)
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
}

