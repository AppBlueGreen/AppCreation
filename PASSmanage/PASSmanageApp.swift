//
//  PASSmanageApp.swift
//  PASSmanage
//
//  Created by aoi suzuki on 2024/09/17.
//

import SwiftUI

//@main
//struct PASSmanageApp: App {
//    var body: some Scene {
//        WindowGroup {
//
//            InitialView()
//                .environmentObject(UserData(selectedNumber: 10, flagEnglish: false, flagFigure: false))
//
//
//
//        }
//    }
//}

@main
struct YourApp: App {
    //    @StateObject private var userData = UserData(selectedNumber: 10, flagEnglish: false, flagFigure: false)
    @StateObject private var userData = UserData()
    
    var body: some Scene {
        WindowGroup {
            InitialView()
                .environmentObject(UserData())
        }
    }
}

