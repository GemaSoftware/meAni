//
//  TopAiringModel.swift
//  meAni
//
//  Created by Agron Gemajli on 2/19/21.
//

import Foundation

struct Top: Codable, Identifiable {
    let id = UUID()
    let top: [TopAiringAnime]
}

struct TopAiringAnime: Codable, Identifiable {
    let id = UUID()
    let mal_id: Int
    let rank: Int
    let title: String
    let image_url: String
    let score: Float
}
