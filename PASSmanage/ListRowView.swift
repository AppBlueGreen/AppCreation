//
//  ListRowView.swift
//  PASSmanage
//
//  Created by aoi suzuki on 2024/09/17.
//

import SwiftUI

// リストの見た目

struct ListRowView: View {
    
    var title: String
    var subtitle: String
    var referkey: Bool
    
    var body: some View {

            ZStack {
                
                VStack {
                    
                    HStack {
                        Text(title)
                            .multilineTextAlignment(.leading)
                            .font(.title3)
                            .bold()
                        
                        Spacer(minLength: 0)
                        
                        // 鍵の表示
                        if referkey {
                            
                            Image(systemName: "lock.fill")
                                .foregroundColor(.black)
                            
                        }
                    }
                    .padding(.horizontal, 20)
                    
                    HStack {
                        Text(subtitle)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.black.opacity(0.4))
                        
                        Spacer(minLength: 0)
                    }
                    .padding(.horizontal, 20)
                    
                }
            }
            .padding()
    }
}

#Preview {
    ListRowView(title: "会員情報", subtitle: "ファミマ", referkey: true)
}
