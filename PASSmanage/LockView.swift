//
//  LockView.swift
//  PASSmanage
//
//  Created by aoi suzuki on 2024/09/17.
//

import SwiftUI

struct LockView: View {
    
    
    @State private var password3 = ""
    
//     You can change it when user clicks reset password.....
    // AppStrage => UserDefaults.....
    
    @AppStorage("lock_Password") var key: String = ""
    @State private var wrongPassword = false

//    let height = UIScreen.main.bounds.width
//    let height = UIScreen.main.bounds.height
    
    @Binding var unLocked: Bool
    
//    @Environment(\.dismiss) var dismiss // ビューを閉じるための環境変数
    
    var body: some View {
        
            VStack {
                
                Spacer()
                
                Text("パスコードを入力してください")
                    .font(.title2)
                    .fontWeight(.heavy)
                    .padding(.top,20)
                
                HStack(spacing: 22) {
                    // Password Cirle View .....
                    
                    ForEach(0..<4, id: \.self) { index in
                        PasswordView(index: index, password3: $password3)
                    }
                    // for smaller size iphones.....
//                    .padding(.top,height < 750 ?  20 : 30)
                    .padding(.top,20 )
                    
                    
                }
                
                // KeyPad.....
                
                Spacer(minLength: 0)
                
                Text(wrongPassword ? "パスワードが違います" : "")
                    .foregroundColor(.red)
                    .fontWeight(.heavy)
                
                Spacer(minLength: 0)
                
//                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: height < 750 ? 5 : 15) {
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 5 ) {
                    
                    
                    //            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 5) {
                    
                    // Password Button.....
                    ForEach(1...9, id: \.self) { value in
                        
                        PasswordButton(value: "\(value)", password3: $password3, key: $key, wrongPass: $wrongPassword,unLocked: $unLocked)
                    }
                    
                    Circle()
                        .frame(width: 80, height: 80)
                        .foregroundColor(.white)
                    
                    PasswordButton(value: "0", password3: $password3, key: $key, wrongPass: $wrongPassword,unLocked: $unLocked)
                    
                    PasswordButton(value: "delete.fill", password3: $password3, key: $key, wrongPass: $wrongPassword,unLocked: $unLocked)
                    
                }
                .padding()
                
            }
            .navigationTitle("")
        
    }
}

struct PasswordView: View {
    var index: Int
    @Binding var password3: String
    
    var body: some View {
        
        ZStack {
            
            Circle()
                .stroke(Color.black,lineWidth: 2)
                .frame(width: 30, height: 30)
            
            // checking whether it is typed .....
            
            if password3.count > index {
                Circle()
                    .fill(Color.black)
                    .frame(width: 30, height: 30)
            }
            
        }
    }
}

struct PasswordButton: View {
    
    var value: String
    @Binding var password3: String
    @Binding var key: String
    //    @Binding var unlocked: Bool
    @Binding var wrongPass: Bool
    
    @Binding var unLocked: Bool

    
    var body: some View {
        
        Button(action: setPassword, label: {
            VStack {
                
                if value.count > 1 {
                    
                    // Image.....
                    Image(systemName: "delete.left")
                        .font(.system(size: 24))
                        .foregroundColor(.black)
                        .shadow(color: .gray.opacity(0.5), radius: 5, x: 5, y: 5)
                        .shadow(color: .white.opacity(1.5), radius: 3, x: -1, y: -1)
                    
                } else {
                    
                    ZStack {
                        
                        Circle()
                            .foregroundColor(.white)
                            .shadow(color: .gray.opacity(0.5), radius: 5, x: 5, y: 5)
                            .shadow(color: .white.opacity(1.5), radius: 3, x: -1, y: -1)
                        
                        Text(value)
                            .font(.title)
                            .foregroundColor(.black)
                    }
                    
                }
            }
            .padding()
        })
    }
    
    func setPassword() {
        
        // ckecking if backspace pressed.....
        
        withAnimation {
            
            if value.count > 1 {
                
                if password3.count != 0 {
                    
                    password3.removeLast()
                }
                
            } else {
                
                if password3.count != 4 {
                    
                    password3.append(value)
                    
                    // Delay Animation.....
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        
                        withAnimation {
                            
                            if password3.count == 4 {
                                
                                // 成功時の処理...
                                if password3 == key {
                                    
                                    unLocked = true
                                    

                                } else {
                                    
                                    wrongPass = true
                                    password3.removeAll()
                                    
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
