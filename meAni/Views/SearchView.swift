//
//  SearchView.swift
//  meAni
//
//  Created by Agron Gemajli on 2/20/21.
//

import SwiftUI
import URLImage



struct SearchView: View {
    
    var body: some View {
        SView()
    }
}

struct SView: View {
    
    @State var searchString = ""
    @State var animeSearch = [AnimeSearch]()
    
    
    var body: some View{
        NavigationView{
            VStack{
                HStack {
                    TextField("Search Anime", text: self.$searchString)
                    Spacer()
                    Button(action: {
                        if(searchString.count >= 3){
                            print("searching")
                            JikanService().SearchAnime(searchQuery: self.searchString) { (animes) in
                                self.animeSearch = animes
                            }
                        }
                        
                    }){
                        Text("Search")
                    }
                }
                .padding(.zero)
                .padding(.leading)
                .padding(.trailing)
                .padding(.top)
                
                List(self.animeSearch) { anime in
                    HStack{
                        URLImage(url: URL(string: anime.image_url!)!, options: URLImageOptions(
                            cachePolicy: .returnCacheElseLoad(cacheDelay: nil, downloadDelay: 0.75) // Return cached image or download after delay
                         ), inProgress: { progress in
                            return Image("noCover").resizable().aspectRatio(contentMode: .fit).frame(height: 75).padding(.trailing)
                        }, failure: { error, retry in
                            Image("noCover").resizable().aspectRatio(contentMode: .fit).frame(height: 75).padding(.trailing)
                        }, content: { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }).frame(width: 50, height: 75)

                        Text(anime.title!)
                        Spacer()
                        
                    }
                    
                }.navigationTitle("Search")
            }
        }
        
    }
}
    
    struct SearchView_Previews: PreviewProvider {
        static var previews: some View {
            SearchView()
        }
    }
