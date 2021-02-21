//
//  AnimeSearchModel.swift
//  meAni
//
//  Created by Agron Gemajli on 2/20/21.
//

import Foundation

struct AnimeSearchResults: Codable, Identifiable {
    let id = UUID()
    let results: [AnimeSearch]
}

struct AnimeSearch: Codable, Identifiable {
    let id = UUID()
    let mal_id: Int?
    let title: String?
    let image_url: String?
}
