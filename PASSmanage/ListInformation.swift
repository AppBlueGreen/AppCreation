//
//  Information.swift
//  PASSmanage
//
//  Created by aoi suzuki on 2024/09/17.
//

import Foundation

import SwiftUI
//
//struct ListInformation: Identifiable {
//    
//    let id = UUID()
//    var title: String
//    var ID: String
//    var PASS: String
//    var subtitle: String
//    var referkey: Bool
//    var backColor: Color
//    
//    init(title: String, ID: String, PASS: String, subtitle: String, referkey: Bool, backColor: Color) {
//        self.title = title
//        self.ID = ID
//        self.PASS = PASS
//        self.subtitle = subtitle
//        self.referkey = referkey
//        self.backColor = backColor
//    }
//}

struct ListInformation: Identifiable, Codable {
    let id: UUID
    var title: String
    var ID: String
    var PASS: String
    var subtitle: String
    var referkey: Bool
    var backColorHex: String // 色をHex形式で保存
    
    // 初期化
    init(title: String, ID: String, PASS: String, subtitle: String, referkey: Bool, backColor: Color) {
        self.id = UUID()
        self.title = title
        self.ID = ID
        self.PASS = PASS
        self.subtitle = subtitle
        self.referkey = referkey
        self.backColorHex = backColor.toHex() // Hexに変換
    }
}

extension Color {
    func toHex() -> String {
        let components = UIColor(self).cgColor.components ?? [0, 0, 0]
        return String(format: "%02X%02X%02X", Int(components[0] * 255), Int(components[1] * 255), Int(components[2] * 255))
    }
}


