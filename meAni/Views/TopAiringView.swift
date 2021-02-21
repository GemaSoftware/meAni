//
//  TopAiringView.swift
//  meAni
//
//  Created by Agron Gemajli on 2/19/21.
//

import SwiftUI
import URLImage

struct TopAiringView: View {
    
    @State var topAiringAnimes = [TopAiringAnime]()
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    
    var body: some View {
        NavigationView {
            ScrollView{
                LazyVGrid(columns: columns){
                    
                    ForEach(topAiringAnimes){ anime in
                        NavigationLink(destination: AnimeView(animeToLoad: anime.mal_id)) {
                            VStack{
                                URLImage(url: URL(string: anime.image_url)!, content: { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                }).frame(width: 100, height: 150)
                                
                                Text(anime.title)
                                    .frame(maxHeight: .infinity, alignment: .top)
                            }
                        }
                        
                    }
                }.onAppear() {
                    if self.topAiringAnimes.count == 0{
                        print("will try to pull animes")
                        JikanService().GetTopAiringAnime() { (animes) in
                            self.topAiringAnimes = animes
                        }
                    }
                }
            }.navigationTitle("Top Airing Animes")
            
        }
    }
}

struct TopAiringView_Previews: PreviewProvider {
    static var previews: some View {
        TopAiringView()
    }
}
