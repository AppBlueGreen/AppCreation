
//  Home.swift
//  PASSmanage
//
//  Created by aoi suzuki on 2024/09/17.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var userData: UserData
//    @AppStorage("userData") var userData
    
    @State private var goToCreateView = false
    @State private var searchText: String = "" // 検索に使う引数
    
    @State var unLocked = false
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                
                // リスト情報
                List {
                    
                    // FoerEachの引数は元々userData.lists
                    ForEach(userData.lists) { member in
                        
                        ZStack {
                            
                            Rectangle()
                                .listRowSeparator(.hidden)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(.black, lineWidth: 0.3)
                                )
                                .shadow(color: .gray.opacity(0.5), radius: 5, x: 3, y: 3)
                            
                            
                            // リスト情報参照...
                            NavigationLink {
                                
                                if member.referkey == true {
                                    
                                    if unLocked {
                                        
                                        ReferenceView(title: member.title, ID: member.ID, PASS: member.PASS, unLocked: $unLocked)
                                        
                                    } else {
                                        
                                        LockView(unLocked: $unLocked)
                                        
                                    }
                                    
                                } else {
                                    ReferenceView(title: member.title, ID: member.ID, PASS: member.PASS, unLocked: $unLocked)
                                }
                                
                                
                            } label: {
                                
                                ListRowView(title: member.title, subtitle: member.subtitle, referkey: member.referkey)
                            }
                            .padding(.trailing, 20)
                            .listRowBackground(Color.clear)
                            .listRowSeparator(.hidden)
                            .cornerRadius(8)
                            
                            
                        }
                        .listRowSeparator(.hidden)
                        .padding(.vertical, 10)
                        
                    }
                    .onDelete(perform: remove)
                    
                    
                }
                .listStyle(.plain)
//                .searchable(text: $searchText, prompt: "検索")
                
                // 新規作成ボタン
                VStack {
                    
                    Spacer(minLength: 0)
                    
                    HStack {
                        
                        Spacer(minLength: 0)
                        
                        Button(action: {
                            
                            goToCreateView = true
                            
                        }, label: {
                            
                            Image(systemName: "plus")
                                .foregroundColor(.white)
                                .font(.system(size: 24))
                                .fullScreenCover(isPresented: $goToCreateView, content: {
                                    CreateView(userData: _userData, goToCreateView: $goToCreateView, inputTitle: "", inputID: "", inputPASS: "", inputSubtitle: "", inputReferKey: false, inputBackColor: .white)
                                })
                                .shadow(radius: 5)
                        })
                        .frame(width: 60, height: 60)
                        .background(Color.accentColor)
                        .cornerRadius(30)
                        .shadow(color: .gray, radius: 3, x: 3, y: 3)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 16))
                    }
                }
                
            }
            .navigationBarItems(trailing: EditButton())
            
        }
        
    }
    
    private func remove(from source : IndexSet) {
        userData.lists.remove(atOffsets: source)
    }
    
//    private func remove(from source: IndexSet) {
//        userData.removeList(at: source)
//    }

    
    
}

//#Preview {
//    HomeView()
//        .environmentObject(UserData(selectedNumber: 10, flagEnglish: false, flagFigure: false))
//}

#Preview {
    HomeView()
        .environmentObject(UserData())
}
