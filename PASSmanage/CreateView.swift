
//  CreateView.swift
//  PASSmanage
//
//  Created by aoi suzuki on 2024/09/17.
//

import SwiftUI
import Combine

struct CreateView: View {
    
    @AppStorage("selectedNumber") var selectedNumber = 10
    @AppStorage("flagEnglish") var flagEnglish = false
    @AppStorage("flagFigure") var flagFigure = false
    
    @EnvironmentObject var userData: UserData
    @Binding var goToCreateView: Bool
    
    @State var inputTitle: String
    @State var inputID: String
    @State var inputPASS: String
    @State var inputSubtitle: String
    @State var inputReferKey: Bool
    @State var inputBackColor: Color
    
    
    // 新規追加
    @State private var selectedColor: String = "白"
    
    //　文字数制限用
//    let maximumCharacters = 20
    
    var body: some View {
        NavigationView {
            
            ScrollView(.vertical, showsIndicators: false) {
                // 入力画面...
                VStack {
                    
                    // タイトル
                    HStack {
                        Text("タイトル")
                            .font(.headline)
                            .bold()
                            .foregroundColor(.black)
                        
                        Spacer(minLength: 0)
                    }
                    .padding(EdgeInsets(
                        top: 40, leading: 30, bottom: 0, trailing: 30
                    ))
                    
                    TextField("入力してください", text: $inputTitle)
                        .multilineTextAlignment(.leading)
                        .font(.subheadline)
                        .padding() // TextFieldの余白
                        .background(Color.white)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(.black, lineWidth: 1)
                        )
                        .padding(EdgeInsets(
                            top: 0, leading: 30, bottom: 10, trailing: 30
                        ))
//                        .onReceive(Just(inputTitle)) { inputText in
//                            
//                            if inputText.count > maximumCharacters {
//                                
//                                inputTitle = String(inputText.prefix(maximumCharacters))
//                            }
//                        }
                    
                    // ID
                    HStack {
                        Text("ID")
                            .font(.headline)
                            .bold()
                            .foregroundColor(.black)
                        
                        Spacer(minLength: 0)
                        
                        // 自動生成ボタン
                        Button(action: {
                            
                            inputID = generateRandomString(length: selectedNumber)
                            
                        }, label: {
                            
                            ZStack {
                                
                                Rectangle()
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                    .frame(width: 50, height: 30)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(.black, lineWidth: 0.1)
                                    )
                                    .shadow(color: .gray.opacity(0.5), radius: 5, x: 5, y: 5)
                                    .shadow(color: .white.opacity(1.5), radius: 3, x: -1, y: -1)
                                
                                Text("生成")
                                    .foregroundColor(.black)
                                    .font(.subheadline)
                            }
                            .padding(.trailing, 10)
                        })
                    }
                    .padding(EdgeInsets(
                        top: 20, leading: 30, bottom: 0, trailing: 30
                    ))
                    
                    TextField("入力してください", text: $inputID)
                        .multilineTextAlignment(.leading)
                        .font(.subheadline)
                        .padding() // TextFieldの余白
                        .background(Color.white)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(.black, lineWidth: 1)
                        )
                        .padding(EdgeInsets(
                            top: 0, leading: 30, bottom: 10, trailing: 30
                        ))
//                        .onReceive(Just(inputID)) { inputText in
//                            
//                            if inputText.count > maximumCharacters {
//                                
//                                inputID = String(inputText.prefix(maximumCharacters))
//                            }
//                        }
                    
                    
                    //  PASS
                    HStack {
                        Text("パスワード")
                            .font(.headline)
                            .bold()
                            .foregroundColor(.black)
                        
                        Spacer(minLength: 0)
                        
                        // 自動生成ボタン
                        Button(action: {
                            
                            inputPASS = generateRandomString(length: selectedNumber)
                            
                        }, label: {
                            
                            ZStack {
                                
                                Rectangle()
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                    .frame(width: 50, height: 30)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(.black, lineWidth: 0.1)
                                    )
                                    .shadow(color: .gray.opacity(0.5), radius: 5, x: 5, y: 5)
                                    .shadow(color: .white.opacity(1.5), radius: 3, x: -1, y: -1)
                                
                                Text("生成")
                                    .foregroundColor(.black)
                                    .font(.subheadline)
                            }
                            .padding(.trailing, 10)
                        })
                    }
                    .padding(EdgeInsets(
                        top: 20, leading: 30, bottom: 0, trailing: 30
                    ))
                    
                    TextField("入力してください", text: $inputPASS)
                        .multilineTextAlignment(.leading)
                        .font(.subheadline)
                        .padding() // TextFieldの余白
                        .background(Color.white)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(.black, lineWidth: 1)
                        )
                        .padding(EdgeInsets(
                            top: 0, leading: 30, bottom: 10, trailing: 30
                        ))
//                        .onReceive(Just(inputPASS)) { inputText in
//                            
//                            if inputText.count > maximumCharacters {
//                                
//                                inputPASS = String(inputText.prefix(maximumCharacters))
//                            }
//                        }
                    
                    // サブタイトル
                    HStack {
                        Text("メモ")
                            .font(.headline)
                            .bold()
                            .foregroundColor(.black)
                        
                        Spacer(minLength: 0)
                    }
                    .padding(EdgeInsets(
                        top: 20, leading: 30, bottom: 0, trailing: 30
                    ))
                    
                    TextField("入力してください", text: $inputSubtitle)
                        .multilineTextAlignment(.leading)
                        .font(.subheadline)
                        .padding() // TextFieldの余白
                        .background(Color.white)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(.black, lineWidth: 1)
                        )
                        .padding(EdgeInsets(
                            top: 0, leading: 30, bottom: 10, trailing: 30
                        ))
//                        .onReceive(Just(inputSubtitle)) { inputText in
//                            
//                            if inputText.count > maximumCharacters {
//                                
//                                inputSubtitle = String(inputText.prefix(maximumCharacters))
//                            }
//                        }
                    
                    Toggle("閲覧時の認証", isOn: $inputReferKey)
                        .font(.headline)
                        .bold()
                        .foregroundColor(.black)
                        .padding(EdgeInsets(
                            top: 30, leading: 30, bottom: 60, trailing: 30
                        ))
                    
                    
                    Spacer()
                    
                    // 作成ボタン...
                    Button(action: {
                        
                        createList()

                        goToCreateView = false
   
                    }, label: {
                        Text("作成完了")
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
                .navigationBarTitle("新規入力", displayMode: .inline)
                .font(.title)
                //　キャンセルボタン...
                .navigationBarItems(leading: Button(action: {
                    
                    goToCreateView = false
                }, label: {
                    Text("キャンセル")
                }))
            }
        }
        
    }
        
    
//    private func createList() {
//        let newList = ListInformation(title: self.inputTitle, ID: self.inputID, PASS: self.inputPASS, subtitle: self.inputSubtitle, referkey: self.inputReferKey, backColor: self.inputBackColor)
//        
////        self.userData.lists.insert(newList, at: 0)
//        self.userData.lists.append(newList)
//    }
    
    private func createList() {
        let newList = ListInformation(title: self.inputTitle, ID: self.inputID, PASS: self.inputPASS, subtitle: self.inputSubtitle, referkey: self.inputReferKey, backColor: inputBackColor)
        
        self.userData.addList(newList) // ここで保存
    }

    
    private func generateRandomString(length: Int) -> String {
        
        var rondom = "0123456789"
        
        if(flagEnglish == true && flagFigure == false) {
            rondom = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
        }
        else if(flagEnglish == false && flagFigure == true) {
            rondom = "0123456789~!@#$%&*_+-=:;<>?"
        }
        else if(flagEnglish == true && flagFigure == true){
            rondom = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ~!@#$%&*_+-=:;<>?"
        }
        return String((0..<length).map { _ in rondom.randomElement()!})
    }

}

//#Preview {
//    
//    CreateView(userData: _userData, goToCreateView: $goToCreateView , inputTitle: "", inputID: "", inputPASS: "", inputSubtitle: "", inputReferKey: "", memo: "")
//}
