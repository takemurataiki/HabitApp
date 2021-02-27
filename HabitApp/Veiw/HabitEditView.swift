//
//  HabitEditView.swift
//  HabitApp
//
//  Created by 竹村　太喜 on 2021/01/29.
//

import SwiftUI

struct HabitEditView: View {

    @State var selectedColor = 0

//    @ObservedObject var newList = NewList()
    @EnvironmentObject var newList: NewList
    
    @Environment(\.presentationMode) var presentation
    
    
    var body: some View {
        
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
                
                ///色の選択
                Picker(selection: $selectedColor, label: Text("Color")) {
                    Text("Red").tag(0)
                    Text("Blue").tag(1)
                    Text("Green").tag(2)
                    Text("Yellow").tag(3)
                    Text("Purple").tag(4)
                }
                .pickerStyle(SegmentedPickerStyle())
                
                HStack {
                    newList.colors[selectedColor]
                        .frame(width: 250.0, height: 100.0)
                }
                
                Spacer()
                
                ///完了ボタン
                Button("ボタン",action: {
                    newList.listArray.append(ListData(title: newList.newTitle,count: 0,  color: newList.colors[selectedColor]))
                    ///テキストの初期化
                    newList.newTitle = ""
                    ///前画面に戻る
                    presentation.wrappedValue.dismiss()
                    
                })
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .border(Color.black)
                
                Spacer()
                    
            }
            .navigationTitle("HabitEditView")
            .navigationBarTitleDisplayMode(.inline)
        }
    
}

struct HabitEditView_Previews: PreviewProvider {
    static var previews: some View {
        HabitEditView()
            .environmentObject(NewList())
            .environmentObject(CountHabit())
    }
}
