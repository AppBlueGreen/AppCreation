//
//  InitialView.swift
//  PASSmanage
//
//  Created by aoi suzuki on 2024/09/17.
//

import SwiftUI
import Combine

// 初回起動時の画面

struct InitialView: View {
    
    @AppStorage("is_init") var isInit = true // 初回画面フラグ
//    @AppStorage("isInit") var isInit = true // 初回画面フラグ

    @State private var page: Int = 1 //ページ番号
    
    var body: some View {
        
        if isInit {
            
            switch page {
                
            case 1:
                Intro1View(page: $page)
            case 2:
                Intro2View(page: $page)
            default:
                ListView()
            }
            
        } else {
            
//            Intro1View(page: $page)
            ContentView()
        }
    }
}

struct Intro1View: View {
    
    @Binding var page: Int
    
    var body: some View {
        
            ZStack {
                
                VStack {
                    
                    
                        Image("HomeIcon")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .cornerRadius(10)
                            .padding(EdgeInsets(
                                top: 100, leading: 30, bottom: 30, trailing: 30
                            ))
                        
                        Text("ようこそ")
                            .font(.title).bold()
                            .padding(.vertical, 20)
         
                        
                        Text("Key Manage へ")
                            .font(.title).bold()
                    
                        Text("このアプリではID, パスワードの管理・作成を行うことができます。つい忘れがちな情報を一元管理できます")
                        .padding(EdgeInsets(
                            top: 30, leading: 40, bottom: 30, trailing: 40
                        ))

                    Spacer()
                    
                    Button(action: {
                        
                            page = 2
                    }, label: {
                        Text("次へ")
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

                }
            }
    }
}

struct Intro2View: View {
    
    @AppStorage("is_init") var isInit = true // 初回画面フラグ
    @AppStorage("lock_Password") var key: String = "1022"
    @State private var password1 = ""
    @State private var password2 = ""
    @Binding var page : Int
    @State private var mistakePass: Bool = false
    @State private var correctPass: Bool = false
    
    // 文字数制限用変数
    let maximumCharacters = 4
    
    var body: some View {
        
        NavigationView {

                VStack(alignment: .leading) {
                    
                    Text("パスコード設定")
                        .font(.title).bold()
                        .padding(30)
                    
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
                        
                        Text("* ログインや入力情報の閲覧時に必要となります")
                            .foregroundColor(Color.black.opacity(1))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size: 12))
                            .padding(EdgeInsets(
                                top: 10, leading: 30, bottom: 30, trailing: 10
                            ))
                        
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
                                    
                                    
                                    key = password1
                                    
                                    withAnimation(){
                                        page = 3
                                    }
                                    isInit = false
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
                        
                    }
                    }
            
        }
        .navigationBarTitle("新規パスコード設定", displayMode: .inline)
    }
}

//#Preview {
//    InitialView()
//        .environmentObject(UserData(selectedNumber: 10, flagEnglish: false, flagFigure: false))
//}

//#Preview {
//    InitialView()
//        .environmentObject(UserData(selectedNumber: 10, flagEnglish: false, flagFigure: false))
//}

#Preview {
    InitialView()
        .environmentObject(UserData())
}
