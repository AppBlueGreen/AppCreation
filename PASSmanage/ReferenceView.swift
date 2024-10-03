//
//  ReferenceView.swift
//  PASSmanage
//
//  Created by aoi suzuki on 2024/09/17.
//

import SwiftUI

struct ReferenceView: View {
    
    @EnvironmentObject var userData: UserData
    
    @State var title: String
    @State var ID: String
    @State var PASS: String
    @State private var CopyButton1 = false
    @State private var CopyButton2 = false
    
    @Binding var unLocked: Bool
    
    @Environment(\.dismiss) var dismiss // ビューを閉じるための環境変数
    
    //    @State var isEditing = false
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                // リスト情報参照欄...
                ZStack {
                    
//                    Rectangle()
//                        .foregroundColor(.black.opacity(0.12))
//                        .cornerRadius(10)
//                        .frame(width: 350, height: 200)
//                        .shadow(color: .gray.opacity(0.7), radius: 5, x: 10, y: 10)
                    
                    VStack {
                        
                        // ID
                        HStack {
                            Text("ID")
                            
                                .font(.headline)
                                .bold()
                            
                            Spacer(minLength: 0)
                        }
                        .padding(.horizontal, 20)
                        
                        HStack {
                            Text("\(ID)")
                                .font(.headline)
                                .bold()
                            
                            Spacer(minLength: 0)
                            
                            // コピーボタン...
                            Button(action: {
                                
                                UIPasteboard.general.string = ID
                                CopyButton1 = true
                                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                    
                                    CopyButton1 = false
                                }
                                
                            }, label: {
                                
                                ZStack {
                                    
                                    Rectangle()
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                        .frame(width: 80, height: 30)
                                        .shadow(color: .gray.opacity(0.5), radius: 5, x: 5, y: 5)
                                        .shadow(color: .white.opacity(1.5), radius: 3, x: -1, y: -1)
                                    
                                    if CopyButton1 {
                                        
                                        Text("copied!")
                                            .bold()
                                            .foregroundColor(.black)
                                        
                                    } else {
                                        
                                        Text("copy")
                                            .bold()
                                            .foregroundColor(.black)
                                    }
                                    
                                }
                            })
                        }
                        .padding(.horizontal, 20)
                        
                        // パスワード
                        HStack {
                            Text("パスワード")
                            
                                .font(.headline)
                                .bold()
                            
                            Spacer(minLength: 0)
                        }
                        .padding(.horizontal, 20)
                        
                        HStack {
                            Text("\(PASS)")
                                .font(.headline)
                                .bold()
                            
                            Spacer(minLength: 0)
                            
                            // コピーボタン...
                            Button(action: {
                                
                                UIPasteboard.general.string = PASS
                                CopyButton2 = true
                                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                    
                                    //                                    CopyButton2 = false
                                }
                                
                            }, label: {
                                
                                ZStack {
                                    
                                    Rectangle()
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                        .frame(width: 80, height: 30)
                                        .shadow(color: .gray.opacity(0.5), radius: 5, x: 5, y: 5)
                                        .shadow(color: .white.opacity(1.5), radius: 3, x: -1, y: -1)
                                    
                                    if CopyButton2 {
                                        
                                        Text("copied!")
                                            .bold()
                                            .foregroundColor(.black)
                                        
                                    } else {
                                        
                                        Text("copy")
                                            .bold()
                                            .foregroundColor(.black)
                                    }
                                    
                                }
                            })
                        }
                        .padding(.horizontal, 20)
                        
                        
                    }
                    
                    
                }
                
                
                
            }
            .padding(EdgeInsets(
                top: 30, leading: 30, bottom: 10, trailing: 30
            ))
            
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("\(title)", displayMode: .inline)
        .toolbar {
            
            ToolbarItem (placement: .navigationBarLeading) {
                
                Button("ホームに戻る") {
                    
                    unLocked = false
                    dismiss()
                }
            }
        }
    }
}

//#Preview {
//    ReferenceView(title: "会員情報", ID: "1111", PASS: "2222")
//}
