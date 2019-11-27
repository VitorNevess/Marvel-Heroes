//
//  DataResponse.swift
//  Marvel Heroes
//
//  Created by joao.vitor.f.naves on 26/11/19.
//  Copyright © 2019 vitor.neves. All rights reserved.
//

import Foundation

struct DataResponse: Codable {
    var offset, limit, total, count: Int?
    var results: [Result]?
}
