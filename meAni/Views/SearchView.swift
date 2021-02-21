//
//  SearchView.swift
//  meAni
//
//  Created by Agron Gemajli on 2/20/21.
//

import SwiftUI

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
                    TextField("Text Field Test", text: self.$searchString)
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
                .padding(.leading)
                .padding(.trailing)
                .padding(.top)
                
                List(self.animeSearch) { anime in
                    Text(anime.title)
                }.padding(.zero)
                
            }.navigationTitle("Search")
        }
    }
    
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
