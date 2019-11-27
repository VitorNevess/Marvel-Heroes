//
//  Thumbnail.swift
//  Marvel Heroes
//
//  Created by joao.vitor.f.naves on 26/11/19.
//  Copyright © 2019 vitor.neves. All rights reserved.
//

import Foundation

struct Thumbnail: Codable {
    var path: String?
    var thumbnailExtension: String?

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}
