//
//  ListView.swift
//  PASSmanage
//
//  Created by aoi suzuki on 2024/09/17.
//

import SwiftUI

struct ListView: View {
    
    @State private var selection = 1
    
    var body: some View {
        
        TabView(selection: $selection) {
            
            HomeView()
                .tabItem {
                    
                    Label("ホーム", systemImage: "house")
                }
                .tag(1)
            
            MenuView()
                .tabItem {
                    
                    Label("メニュー", systemImage: "line.3.horizontal")
                }
                .tag(2)
        }
    }
}
