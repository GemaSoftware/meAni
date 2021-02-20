//
//  HomeView.swift
//  meAni
//
//  Created by Agron Gemajli on 2/20/21.
//

import SwiftUI
import URLImage

struct HomeView: View {
    var body: some View {
        NavigationView{
            ScrollView {
                ZStack{
                    VStack{
                        HomeAnimeCarousel()
                        HomeTopAiring()
                        HomeMostPopular()
                        Spacer()
                    }
                }
            }
            .navigationTitle("meAni")
        }
    }
}

struct HomeAnimeCarousel: View {
    var body: some View{
        GeometryReader { geometry in
            ImageCarouselView(numberOfImages: 3) {
                Image("att1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .clipped()
                
                Image("hori1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .clipped()
                
                Image("juju1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .clipped()
            }
        }.frame(height: 250, alignment: .center)
    }
}

struct HomeTopAiring: View {
    @State var topAiringAnimes = [TopAiringAnime]()
    let rows: [GridItem] = Array(repeating: .init(.flexible()), count: 1)
    
    var body: some View{
        VStack(spacing: 10){ // Will be the Top airing anime in a side scroller
            HStack{
                Text("Top Airing").font(.title2).fontWeight(.bold)
                Spacer()
            }.padding(.leading).padding(.top)
            //Add scroller here or in Vstack
            ScrollView(.horizontal){
                LazyHGrid(rows: rows){
                    ForEach(topAiringAnimes){ anime in
                        NavigationLink(destination: AnimeView(animeToLoad: anime.mal_id)) {
                            VStack{
                                URLImage(url: URL(string: anime.image_url)!, content: { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                }).frame(width: 100, height: 150, alignment: .top)
                            }
                        }
                    }
                }.padding(.zero)
            }.frame(height: 175)
            
        }.onAppear() {
            if self.topAiringAnimes.count == 0{
                print("will try to pull top airing animes")
                JikanService().GetTopAiringAnime() { (animes) in
                    self.topAiringAnimes = animes
                }
            }
        }
    }
}

struct HomeMostPopular: View {
    
    @State var topAnime = [TopAiringAnime]()
    let rows: [GridItem] = Array(repeating: .init(.flexible()), count: 1)
    
    
    var body: some View{
        VStack(spacing: 10){ // Will be the Top airing anime in a side scroller
            HStack{
                Text("Most Popular").font(.title2).fontWeight(.bold)
                Spacer()
            }.padding(.leading).padding(.top)
            //Add scroller here or in Vstack
            ScrollView(.horizontal){
                LazyHGrid(rows: rows){
                    ForEach(topAnime){ anime in
                        NavigationLink(destination: AnimeView(animeToLoad: anime.mal_id)) {
                            VStack{
                                URLImage(url: URL(string: anime.image_url)!, content: { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                }).frame(width: 100, height: 150, alignment: .top)
                            }
                        }
                    }
                }.onAppear() {
                    if self.topAnime.count == 0{
                        print("will try to pull top animes")
                        JikanService().GetTopAnime() { (animes) in
                            self.topAnime = animes
                        }
                    }
                }.padding(.zero)
            }.frame(height: 175)
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
