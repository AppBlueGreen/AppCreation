//
//  UserData.swift
//  PASSmanage
//
//  Created by aoi suzuki on 2024/09/17.
//

import SwiftUI

//class UserData: ObservableObject {
//    
//    @Published var lists: [ListInformation] = [
//
//        ListInformation(title: "会員情報1", ID: "1111111111", PASS: "1111111111", subtitle: "ファミマ", referkey: true, backColor: .white),
//        ListInformation(title: "会員情報2", ID: "2222222222", PASS: "2222222222", subtitle: "ローソン", referkey: false, backColor: .white),
//    ]
//    
//    @Published var selectedNumber: Int = 10
//    @Published var flagEnglish: Bool = false
//    @Published var flagFigure: Bool = false
//    
//    init(selectedNumber: Int, flagEnglish: Bool, flagFigure: Bool) {
//        
//        self.selectedNumber = selectedNumber
//        self.flagEnglish = flagEnglish
//        self.flagFigure = flagFigure
//    }
//    
//    
//}


class UserData: ObservableObject {
    @Published var lists: [ListInformation] = []
    @Published var selectedNumber: Int = 10
    
    private let userDefaultsKey = "userDataLists"
    
    init() {
        loadData()
    }
    
    private func saveData() {
        if let encoded = try? JSONEncoder().encode(lists) {
            UserDefaults.standard.set(encoded, forKey: userDefaultsKey)
        }
    }
    
    private func loadData() {
        if let savedData = UserDefaults.standard.data(forKey: userDefaultsKey) {
            if let decodedLists = try? JSONDecoder().decode([ListInformation].self, from: savedData) {
                self.lists = decodedLists
            }
        }
    }
    
    func addList(_ list: ListInformation) {
        lists.append(list)
        saveData()
    }
    
    func removeList(at offsets: IndexSet) {
        lists.remove(atOffsets: offsets)
        saveData()
    }
}
