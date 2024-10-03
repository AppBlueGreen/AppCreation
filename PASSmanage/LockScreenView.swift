//
//  LockScreenView.swift
//  PASSmanage
//
//  Created by aoi suzuki on 2024/09/17.
//

import SwiftUI



struct LockScreenView: View {

    @State private var password = ""
    
    // You can change it when user clicks reset password.....
    // AppStrage => UserDefaults.....
    
    @AppStorage("lock_Password") var key: String = "5654"
    
    @Binding var unLocked: Bool
    
    @State private var wrongPassword = false
    
//    let height = UIScreen.main.bounds.width
    
    var body: some View {
        VStack {
            
            Spacer()
            
            Text("パスワードを入力してください")
                .font(.title2)
                .fontWeight(.heavy)
                .padding(.top,20)
            
            HStack(spacing: 22) {
                // Password Cirle View .....
                
                ForEach(0..<4, id: \.self) { index in
                    PasswordView1(index: index, password: $password)
                }
                // for smaller size iphones.....
//                .padding(.top,height < 750 ?  20 : 30)
                .padding(.top,20)
                
            }
            
            // KeyPad.....
            
            Spacer(minLength: 0)
            
            Text(wrongPassword ? "パスワードが違います" : "")
                .foregroundColor(.red)
                .fontWeight(.heavy)
            
            Spacer(minLength: 0)
            
//            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: height < 750 ? 5 : 15) {
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 5) {
                
                // Password Button.....
                ForEach(1...9, id: \.self) { value in
                    
                    PasswordButton1(value: "\(value)", password: $password, key: $key, unlocked: $unLocked, wrongPass: $wrongPassword)
                }
                
                Circle()
                    .frame(width: 80, height: 80)
                    .foregroundColor(.white)
                
                PasswordButton1(value: "0", password: $password, key: $key, unlocked: $unLocked, wrongPass: $wrongPassword)
                
                PasswordButton1(value: "delete.fill", password: $password, key: $key, unlocked: $unLocked, wrongPass: $wrongPassword)
                
            }
            .padding()
            
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

struct PasswordView1: View {
    var index: Int
    @Binding var password: String
    
    var body: some View {
        ZStack {
            
            Circle()
                .stroke(Color.black,lineWidth: 2)
                .frame(width: 30, height: 30)
            
            // checking whether it is typed .....
            
            if password.count > index {
                Circle()
                    .fill(Color.black)
                    .frame(width: 30, height: 30)
            }
            
        }
    }
}

struct PasswordButton1: View {
    
    var value: String
    @Binding var password: String
    @Binding var key: String
    @Binding var unlocked: Bool
    @Binding var wrongPass: Bool
    
    var body: some View {
        
        Button(action: setPassword, label: {
            VStack {
                
                if value.count > 1 {
                    
                    // Image.....
                    Image(systemName: "delete.left")
                        .font(.system(size: 24))
                        .foregroundColor(.black)
                    
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
                
                if password.count != 0 {
                    
                    password.removeLast()
                }
                
            } else {
                
                if password.count != 4 {
                    
                    password.append(value)
                    
                    // Delay Animation.....
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        
                        withAnimation {
                            
                            if password.count == 4 {
                                
                                // パスワード成功時
                                if password == key {
                                    
                                    unlocked = true
                                    
                                // パスワード間違え
                                } else {
                                    
                                    wrongPass = true
                                    password.removeAll()
                                    
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
