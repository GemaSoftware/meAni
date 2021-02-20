//
//  ContentView.swift
//  meAni
//
//  Created by Agron Gemajli on 2/19/21.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        UITabBar.appearance().barTintColor = UIColor(named: "tabBarColor")
    }
    
    var body: some View {
        TabView{
            HomeView().tabItem({
                Image(systemName: "house.fill")
                Text("Home")
            })
            SearchView().tabItem({
                Image(systemName: "2.square.fill")
                Text("Search")
            })
        }
        .edgesIgnoringSafeArea(.top)
        .colorScheme(.dark)
        .accentColor(.red)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TopAiringView()
    }
}
