//
//  SetButton.swift
//  PASSmanage
//
//  Created by aoi suzuki on 2024/09/17.
//

import SwiftUI

struct SetButton: View {

    @AppStorage("selectedNumber") var selectedNumber = 10
    @AppStorage("flagEnglish") var flagEnglish = false
    @AppStorage("flagFigure") var flagFigure = false
    
    
    var body: some View {
        
        NavigationView {
            
            List {
                
                // パスコードの桁数の指定...
                Picker("桁数の指定", selection: $selectedNumber) {
                    Text("4").tag(4)
                    Text("5").tag(5)
                    Text("6").tag(6)
                    Text("7").tag(7)
                    Text("8").tag(8)
                    Text("9").tag(9)
                    Text("10").tag(10)
                    Text("11").tag(11)
                    Text("12").tag(12)
                    Text("13").tag(13)
                    Text("14").tag(14)
                    Text("15").tag(15)
                    Text("16").tag(16)
                    Text("17").tag(17)
                    Text("18").tag(18)
                    Text("19").tag(19)
                    Text("20").tag(20)
                } // 4 ~ 20
                .bold()
                .frame(width: 300)
                .padding()
                
                Toggle("英字を含む", isOn: $flagEnglish)
                    .bold()
                    .padding()
                
                Toggle("特殊文字・記号を含む", isOn: $flagFigure)
                    .bold()
                    .padding()
            }
            .listStyle(.plain)
            .padding()
        }
        .navigationBarTitle("自動生成ボタン", displayMode: .inline)
    }
}

#Preview {
    SetButton()
}
