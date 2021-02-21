//
//  JikanService.swift
//  meAni
//
//  Created by Agron Gemajli on 2/19/21.
//

import Foundation
import Network
import SwiftUI

class JikanService {
    
    var mainURL = String("http://192.168.1.13:9001/v3/")
    
    func GetTopAiringAnime(completion:@escaping ([TopAiringAnime]) -> ()) {
        guard let topURL = URL(string: self.mainURL+"top/anime/1/airing") else {
            return
        }
        URLSession.shared.dataTask(with: topURL) { (data, _, _) in
            let animes = try! JSONDecoder().decode(Top.self, from: data!)
            
            DispatchQueue.main.async {
                completion(animes.top)
            }
        }.resume()
    }
    
    func GetTopAnime(completion:@escaping ([TopAiringAnime]) -> ()) {
        guard let topURL = URL(string: self.mainURL+"top/anime/1") else {
            return
        }
        URLSession.shared.dataTask(with: topURL) { (data, _, _) in
            let animes = try! JSONDecoder().decode(Top.self, from: data!)
            
            DispatchQueue.main.async {
                completion(animes.top)
            }
        }.resume()
    }
    
    func GetAnimeByID(mal_id: Int, completion:@escaping (AnimeModel) -> ()) {
        guard let animeURL = URL(string: self.mainURL+"anime/\(mal_id)") else {
            return
        }
        
        URLSession.shared.dataTask(with: animeURL) { (data, _, _) in
            let anime = try! JSONDecoder().decode(AnimeModel.self, from: data!)
            
            DispatchQueue.main.async {
                completion(anime)
            }
        }.resume()
    }
    
    func SearchAnime(searchQuery:String, completion:@escaping ([AnimeSearch]) -> ()) {
        let encodedQuery = searchQuery.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        guard let topURL = URL(string: self.mainURL+"search/anime?q=\(encodedQuery!)&page=1&limit=7") else {
            return
        }
        URLSession.shared.dataTask(with: topURL) { (data, _, _) in
            let animes = try! JSONDecoder().decode(AnimeSearchResults.self, from: data!)
            print("got animes from search")
            
            DispatchQueue.main.async {
                completion(animes.results)
            }
        }.resume()
    }
    
}
