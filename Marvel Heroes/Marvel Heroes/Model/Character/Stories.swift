//
//  Stories.swift
//  Marvel Heroes
//
//  Created by joao.vitor.f.naves on 26/11/19.
//  Copyright © 2019 vitor.neves. All rights reserved.
//

import Foundation

struct Stories: Codable {
    var available: Int?
    var collectionURI: String?
    var items: [StoriesItem]?
    var returned: Int?
}
