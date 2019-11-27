//
//  Result.swift
//  Marvel Heroes
//
//  Created by joao.vitor.f.naves on 26/11/19.
//  Copyright © 2019 vitor.neves. All rights reserved.
//

import Foundation

struct Result: Codable {
    var id: Int?
    var name, resultDescription: String?
    var modified: String?
    var thumbnail: Thumbnail?
    var resourceURI: String?
    var comics, series: Comics?
    var stories: Stories?
    var events: Comics?
    var urls: [URLElement]?

    enum CodingKeys: String, CodingKey {
        case id, name
        case resultDescription = "description"
        case modified, thumbnail, resourceURI, comics, series, stories, events, urls
    }
}
