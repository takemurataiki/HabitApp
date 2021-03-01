//
//  HabitEditView.swift
//  HabitApp
//
//  Created by 竹村　太喜 on 2021/01/29.
//

import SwiftUI

struct HabitEditView: View {

    @State var selectedColors = 0
    @State var colorName = ["Red","Blue","Green","Yellow","Purple"]
    @State var selectedColor: Color

//    @ObservedObject var newList = NewList()
    @EnvironmentObject var newList: NewList
    
    @Environment(\.presentationMode) var presentation
    
    
    var body: some View {
        
        NavigationView {
            VStack {
                    
                    Spacer()

                    Text("何を習慣にしたいですか？")
                        .font(.footnote)
                        .foregroundColor(.gray)
                    
                    ///テキスト書き込み
                    TextField("習慣を入れてください", text: $newList.newTitle)
                        .frame(width: 250.0)
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    ///テキスト書き込み
                    TextField("補足メモ", text: .constant(""))
                        .frame(width: 250.0, height: 100.0)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                   
                
                    HStack {
                        ForEach(newList.colors, id:  \.self) { index in
                            CheckBox(selectedColor: $selectedColor, color: index)
                        }.padding(.all)
                            
                    }
                    
                
                
                    
                    Spacer()
                    ///完了ボタン
                    Button("ボタン",action: {
                        newList.listArray.append(ListData(title: newList.newTitle,count: 0,  color: selectedColor))
                        ///テキストの初期化
                        newList.newTitle = ""
                        ///前画面に戻る
                        presentation.wrappedValue.dismiss()
                        
                    })
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .border(Color.black)
                
                    
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
