//
//  ContentView.swift
//  meAni
//
//  Created by Agron Gemajli on 2/19/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            HomeView().tabItem({
                Image(systemName: "1.square.fill")
                Text("Home")
            })
            TopAiringView().tabItem({
                Image(systemName: "2.square.fill")
                Text("Top")
            })
            SearchView().tabItem({
                Image(systemName: "2.square.fill")
                Text("Search")
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TopAiringView()
    }
}
