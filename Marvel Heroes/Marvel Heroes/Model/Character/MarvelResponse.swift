//
//  MarvelResponse.swift
//  Marvel Heroes
//
//  Created by joao.vitor.f.naves on 26/11/19.
//  Copyright © 2019 vitor.neves. All rights reserved.
//

import Foundation

struct MarvelResponse: Codable {
    var code: Int?
    var status, copyright, attributionText, attributionHTML: String?
    var etag: String?
    var data: DataResponse?
}
