//
//  HabitEditView.swift
//  HabitApp
//
//  Created by 竹村　太喜 on 2021/01/29.
//

import SwiftUI

struct HabitEditView: View {
    
    @State var colorName = ["Red","Blue","Green","Yellow","Purple"]
    @State var selectedColor: Color

//    @ObservedObject var newList = NewList()
    @EnvironmentObject var newList: NewList
    
    @Environment(\.presentationMode) var presentation
    
    
    var body: some View {
        
        NavigationView {
            VStack {
                    
                    Text("何を習慣にしたいですか？")
                        .font(.callout)
                        .fontWeight(.black)
                        .foregroundColor(.gray)
                        .lineLimit(nil)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        
                        
                    
                    ///テキスト書き込み
                    TextField("習慣を入れてください", text: $newList.newTitle)
                        .frame(width: 300.0, height: 80.0)
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                        .shadow(radius: /*@START_MENU_TOKEN@*/6/*@END_MENU_TOKEN@*/)
                        
                        
                    
                    ///テキスト書き込み
                TextField("補足メモ", text: .constant(""))
                    .padding(.bottom, 50.0)
                        .frame(width: 300.0, height: 80.0)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .cornerRadius(/*@START_MENU_TOKEN@*/12.0/*@END_MENU_TOKEN@*/)
                        .shadow(radius: /*@START_MENU_TOKEN@*/6/*@END_MENU_TOKEN@*/)
                            
                
                    
                
                    Text("【 テーマ色 】")
                        .font(.footnote)
                        .fontWeight(.black)
                        .foregroundColor(.gray)
                        
                
                    ///テーマカラー選択
                    HStack {
                        ForEach(newList.colors, id:  \.self) { index in
                            CheckBox(selectedColor: $selectedColor, color: index)
                        }
                        .padding([.top, .leading, .trailing], 10.0)
                       
                            
                    }
                    .frame(width: 250.0)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    
                    Spacer()
                    
                    ///完了ボタン
                    Button("完了ボタン",action: {
                        newList.listArray.append(ListData(title: newList.newTitle,count: 0,  color: selectedColor, timeStamp: "", isShow: false))
                        ///テキストの初期化
                        newList.newTitle = ""
                        ///前画面に戻る
                        presentation.wrappedValue.dismiss()
                        
                    })
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .font(.title2)
                    .foregroundColor(.white)
                    .background(selectedColor.opacity(0.8))
                    .cornerRadius(/*@START_MENU_TOKEN@*/15.0/*@END_MENU_TOKEN@*/)
                    .shadow(radius: /*@START_MENU_TOKEN@*/6/*@END_MENU_TOKEN@*/)
                
                
                    
                    Spacer()
                        
                }
            
            }
        }
}

struct HabitEditView_Previews: PreviewProvider {
    static var previews: some View {
        HabitEditView( selectedColor: .purple)
            .environmentObject(NewList())
            .environmentObject(CountHabit())
    }
}
