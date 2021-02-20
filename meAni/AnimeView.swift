//
//  AnimeView.swift
//  meAni
//
//  Created by Agron Gemajli on 2/20/21.
//

import SwiftUI
import URLImage

struct AnimeView: View {
    
    var animeToLoad: Int
    
    @State var anime = AnimeModel(title: "Loading", title_english: "Loading", image_url: "Loading", status: "Loading", synopsis: "Loading")
    
    init(animeToLoad: Int) {
        self.animeToLoad = animeToLoad
    }
    
    var body: some View {
        
        ScrollView{
            VStack{
                HStack(alignment: .center){
                    URLImage(url: URL(string: anime.image_url!)!, content: { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }).frame(width: 200, height: 275)
                }
                Text(self.anime.title).fontWeight(.bold).font(.title)
                Text(self.anime.synopsis).font(.body).fontWeight(.light)
                Spacer()
                
            }
        }.onAppear(){
            JikanService().GetAnimeByID(mal_id: self.animeToLoad, completion: { anime in
                self.anime = anime
            })
        }
        .navigationBarTitleDisplayMode(.inline)
        
    }
}
