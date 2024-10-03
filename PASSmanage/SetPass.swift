//
//  SetPass.swift
//  PASSmanage
//
//  Created by aoi suzuki on 2024/09/17.
//

import SwiftUI
import Combine

struct SetPass: View {
    
    @AppStorage("lock_Password") var key: String = ""
    @State private var password1 = ""
    @State private var password2 = ""
    let maximumCharacters = 4
    
    @Environment(\.dismiss) var dismiss // ビューを閉じるための環境変数
    @State private var mistakePass: Bool = false
    @State private var correctPass: Bool = false   
    
    @Binding var unLocked: Bool
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                // 新規パスコード入力
                HStack {
                    Text("新規パスコード")
                        .font(.headline)
                        .bold()
                        .foregroundColor(.black)
                    
                    Spacer(minLength: 0)
                }
                .padding(EdgeInsets(
                    top: 40, leading: 30, bottom: 0, trailing: 30
                ))
                
                TextField("4桁で入力してください", text: $password1)
                    .multilineTextAlignment(.leading)
                    .font(.headline)
                    .padding() // TextFieldの余白
                    .background(Color.black.opacity(password1 == "" ? 0: 0.1))
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(.black, lineWidth: 1)
                    )
                    .padding(EdgeInsets(
                        top: 0, leading: 30, bottom: 10, trailing: 30
                    ))
                    .keyboardType(.numberPad)
                    .onReceive(Just(password1)) { inputText in
                        
                        if inputText.count > maximumCharacters {
                            
                            password1 = String(inputText.prefix(maximumCharacters))
                        }
                    }
                
                // パスワード再入力
                HStack {
                    Text("パスワード再入力")
                        .font(.headline)
                        .bold()
                        .foregroundColor(.black)
                    
                    Spacer(minLength: 0)
                }
                .padding(EdgeInsets(
                    top: 40, leading: 30, bottom: 0, trailing: 30
                ))
                
                SecureField("新規パスワード(確認用)", text: $password2)
                    .multilineTextAlignment(.leading)
                    .font(.headline)
                    .padding() // TextFieldの余白
                    .background(Color.black.opacity(password2 == "" ? 0: 0.1))
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(.black, lineWidth: 1)
                    )
                    .padding(EdgeInsets(
                        top: 0, leading: 30, bottom: 10, trailing: 30
                    ))
                    .keyboardType(.numberPad)
                    .onReceive(Just(password2)) { inputText in
                        
                        if inputText.count > maximumCharacters {
                            
                            password2 = String(inputText.prefix(maximumCharacters))
                        }
                    }
                
                Spacer(minLength: 0)
                
                if mistakePass {

                        Text("パスコードが正しくありません")
                            .font(.subheadline)
                            .foregroundColor(.red)
                            .fontWeight(.heavy)
                            .padding()
                }
                
                if correctPass {
                        
                    Text("設定が完了しました")
                        .font(.subheadline)
                        .foregroundColor(.blue)
                        .fontWeight(.heavy)
                        .padding()
                }
                
                
                
                // 設定完了ボタン...
                Button(action: {
                    
                    if (password1.count == 4 && password2.count == 4 && password1 == password2) {
                        
                        mistakePass = false
                        correctPass = true
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                            
                            dismiss()
                            unLocked = false
                            key = password1
                            password1 = ""
                            password2 = ""
                        }
                        
                        
                    } else {
                        mistakePass = true
                    }
                    
                }, label: {
                    Text("設定完了")
                        .font(.headline)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(.blue)
                        .shadow(radius: 10)
                        .clipShape(Capsule())
                        .shadow(color: .gray.opacity(0.7), radius: 5, x: 5, y: 5)
                })
                .padding(.bottom, 10)
            }
            
        }
        .navigationBarTitle("パスコード設定", displayMode: .inline)
        .font(.title)
    }
}

