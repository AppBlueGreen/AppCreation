
//  ContentView.swift
//  PASSmanage
//
//  Created by aoi suzuki on 2024/09/17.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var userData: UserData
    @State private var unLocked: Bool = false
    
    var body: some View {
        
        if unLocked {
            
            ListView()
            
        } else {
            
            LockScreenView(unLocked: $unLocked)
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(UserData())
}

