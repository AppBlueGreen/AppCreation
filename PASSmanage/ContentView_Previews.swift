//
//  ContentView_Previews.swift
//  PASSmanage
//
//  Created by aoi suzuki on 2024/09/17.
//

import SwiftUI

struct ContentView_Previews: View {
    
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        
        ListView()
    }
}

#Preview {
    ContentView_Previews()
        .environmentObject(UserData())
}
