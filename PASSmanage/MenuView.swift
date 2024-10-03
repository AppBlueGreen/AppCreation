//
//  MenuView.swift
//  PASSmanage
//
//  Created by aoi suzuki on 2024/09/17.
//

import SwiftUI
import StoreKit

struct MenuView: View {
    
    
    @Environment(\.requestReview) var Review
    @State private var isShowSetPass = false
    @EnvironmentObject var userData: UserData
    
    @State var unLocked = false
    
    var body: some View {
        
        NavigationView {
            
            List {
                //　一般
                Section {
                    
                    // パスコードの設定
                    
                    NavigationLink {
                        
                        if unLocked {
                            
                            SetPass(unLocked: $unLocked)
                            
                        } else {
                            
//                            SetPass(unLocked: $unLocked)
                            LockView2(unLocked: $unLocked)
                            
                            
                        }
                        
                        
                        
                    } label: {
                        
                        HStack {
                            
                            Image(systemName: "lock")
                            Text("パスコードの設定")
                                .bold()
                        }
                        .padding()
                    }
                    
                    //　自動生成ボタンの設定
                    NavigationLink {
                        
                        SetButton()
                        
                    } label: {
                        
                        HStack {
                            Image(systemName: "button.horizontal.top.press")
                            Text("自動生成ボタン")
                                .bold()
                        }
                        .padding()
                    }
                    
                    
                } header: {
                    Text("一般")
                        .bold()
                }
                
                // その他
                Section {
                    // レビュー
                    Button(action: {
                        Review()
                    }, label: {
                        HStack {
                            Image(systemName: "star")
                            Text("レビュー")
                                .bold()
                        }
                    })
                    .padding()
                    
                    
                    // ご意見・問題の報告
                    Button(action: {
                        
                        openURL()
                        
                    }, label: {
                        HStack {
                            Image(systemName: "envelope")
                            Text("ご意見・問題の報告")
                                .bold()
                        }
                    })
                    .padding()
                    
                } header: {
                    Text("その他")
                        .bold()
                }
            }
            .listStyle(.plain)
            .padding()
        }
    }
    
    func openURL() {
        if let url = URL(string: "https://docs.google.com/forms/d/e/1FAIpQLSeSBfB9-kxzs6JD_tdATQaMcigBox3sN0aaXj-i6CqDuPhNSg/viewform?usp=sf_link") {
            
            UIApplication.shared.open(url)
        }
    }
}

#Preview {
    MenuView()
}
