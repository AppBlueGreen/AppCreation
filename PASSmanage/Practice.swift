//
//  Practice.swift
//  PASSmanage
//
//  Created by aoi suzuki on 2024/09/17.
//

import Foundation

// HomeViewからリストにナヴィゲーション遷移をしたい場合...

//NavigationLink {
//    
//    ReferenceView(title: index.title, ID: index.ID, PASS: index.PASS, text: index.memo)
//    
//} label: {
//    
//    ListRowView(title: index.title, subtitle: index.subtitle, referkey: index.referkey)
//}
//.padding(.trailing, 20)
//.listRowBackground(Color.clear)
//.listRowSeparator(.hidden)
//.cornerRadius(8)
//.overlay(
//    RoundedRectangle(cornerRadius: 8)
//        .stroke(.black, lineWidth: 0.5)
//)
//.padding(.horizontal, 10)


//// リスト情報参照...
//Button(action: {
//    
//    if index.referkey {
//        
//        isPassModalPresented = true
//        
//    } else {
//        
//        isModalPresented = true
//        
//    }
//    
//    
//    
//}, label: {
//    ListRowView(title: index.title, subtitle: index.subtitle, referkey: index.referkey)
//})
//// パスワード入力画面...
//.sheet(isPresented: $isPassModalPresented) {
//    
//    LockView(isPassModalPresented: $isPassModalPresented, onSuccess: {
//        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
//            
//            isModalPresented = true
//        }
//    })
//}
////リスト情報表示先...
//.sheet(isPresented: $isModalPresented, content: {
//    ReferenceView(title: index.title, ID: index.ID, PASS: index.PASS, subtitle: index.subtitle, referkey: index.referkey, backColor: index.backColor)
//        .presentationDetents([.height(250)])
//    
//})
//.padding(.trailing, 20)
//.listRowBackground(Color.clear)
//.listRowSeparator(.hidden)
//.cornerRadius(8)


//Button(action: {
//    
//    isModalPresented = true
//    
//}, label: {
//    ListRowView(title: index.title, subtitle: index.subtitle, referkey: index.referkey)
//})
//// パスワード入力画面...
//.sheet(isPresented: $isPassModalPresented) {
//    
//    LockView(isPassModalPresented: $isPassModalPresented, onSuccess: {
//        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
//            
//            isModalPresented = true
//        }
//    })
//}
////リスト情報表示先...
//.sheet(isPresented: $isModalPresented, content: {
//    ReferenceView(title: index.title, ID: index.ID, PASS: index.PASS, subtitle: index.subtitle, referkey: index.referkey, backColor: index.backColor)
//        .presentationDetents([.height(250)])
//    
//})
//.padding(.trailing, 20)
//.listRowBackground(Color.clear)
//.listRowSeparator(.hidden)
//.cornerRadius(8)



//// リスト情報参照...
//if index.referkey == true {
//    
//    Button(action: {
//        
//        isPassModalPresented = true
//        
//    }, label: {
//        ListRowView(title: index.title, subtitle: index.subtitle, referkey: index.referkey)
//    })
//    // パスワード入力画面...
//    .sheet(isPresented: $isPassModalPresented) {
//        
//        LockView(isPassModalPresented: $isPassModalPresented, isModalPresented: $isModalPresented)
//    }
//    //リスト情報表示先...
//    .sheet(isPresented: $isModalPresented, content: {
//        ReferenceView(title: index.title, ID: index.ID, PASS: index.PASS, subtitle: index.subtitle, referkey: index.referkey, backColor: index.backColor)
//            .presentationDetents([.height(250)])
//        
//    })
//    .padding(.trailing, 20)
//    .listRowBackground(Color.clear)
//    .listRowSeparator(.hidden)
//    .cornerRadius(8)
//    
//} else {
//    
//    Button(action: {
//        
//        isModalPresented = true
//        
//    }, label: {
//        ListRowView(title: index.title, subtitle: index.subtitle, referkey: index.referkey)
//    })
//    //リスト情報表示先...
//    .sheet(isPresented: $isModalPresented, content: {
//        ReferenceView(title: index.title, ID: index.ID, PASS: index.PASS, subtitle: index.subtitle, referkey: index.referkey, backColor: index.backColor)
//            .presentationDetents([.height(250)])
//        
//    })
//    .padding(.trailing, 20)
//    .listRowBackground(Color.clear)
//    .listRowSeparator(.hidden)
//    .cornerRadius(8)
//    
//}




//Button(action: {
//    
//    selectedMember = member // 選択したメンバーを保持
//    
//    if member.referkey == true {
//        
//        isPassModalPresented = true
//        
//        
//    } else {
//        
//        isModalPresented = true
//        
//    }
//    
//}, label: {
//    ListRowView(title: member.title, subtitle: member.subtitle, referkey: member.referkey)
//})
//// パスワード入力画面...
//.fullScreenCover(isPresented: $isPassModalPresented) {
//    
//    LockView(isPassModalPresented: $isPassModalPresented, isModalPresented: $isModalPresented)
//}
//.sheet(isPresented: $isModalPresented) {
//    if var member = selectedMember {
//        ReferenceView(title: member.title, ID: member.ID, PASS: member.PASS, backColor: member.backColor)
//            .presentationDetents([.height(250)])
//    }
//}
//.padding(.trailing, 20)
//.listRowBackground(Color.clear)
//.listRowSeparator(.hidden)
//.cornerRadius(8)




//    .filter( { search in
//        
//        if self.searchText.isEmpty {
//            
//            return true
//        }
//        return search.title == self.searchText
//        
//    })



// HomeView

// リスト情報

//List {
//    
//    // FoerEachの引数は元々userData.lists
//    ForEach(userData.lists) { member in
//        
//        ZStack {
//            
//            Rectangle()
//                .listRowSeparator(.hidden)
//                .foregroundColor(member.backColor)
//                .cornerRadius(10)
//                .overlay(
//                    RoundedRectangle(cornerRadius: 8)
//                        .stroke(.black, lineWidth: 0.3)
//                )
//                .shadow(color: .gray.opacity(0.5), radius: 5, x: 3, y: 3)
//            
//            
//            // リスト情報参照...
//            NavigationLink {
//                
//                if member.referkey == true {
//                    
//                    if unLocked {
//                        
//                        ReferenceView(title: member.title, ID: member.ID, PASS: member.PASS, unLocked: $unLocked)
//                        
//                    } else {
//                        
//                        LockView(unLocked: $unLocked)
//                        
//                    }
//                    
//                } else {
//                    ReferenceView(title: member.title, ID: member.ID, PASS: member.PASS, unLocked: $unLocked)
//                }
//                
//                
//            } label: {
//                
//                ListRowView(title: member.title, subtitle: member.subtitle, referkey: member.referkey)
//            }
//            .padding(.trailing, 20)
//            .listRowBackground(Color.clear)
//            .listRowSeparator(.hidden)
//            .cornerRadius(8)
//            
//            
//        }
//        .listRowSeparator(.hidden)
//        .padding(.vertical, 10)
//        
//    }
//    .onDelete(perform: remove)
//    
//    
//}
//.listStyle(.plain)
//.searchable(text: $searchText, prompt: "検索")
