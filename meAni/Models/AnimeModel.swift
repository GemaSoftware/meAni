//
//  AnimeModel.swift
//  meAni
//
//  Created by Agron Gemajli on 2/20/21.
//

import Foundation

struct AnimeModel: Codable, Identifiable {
    let id = UUID()
    let title: String
    let title_english: String?
    let image_url: String?
    let status: String
    let synopsis: String
}
