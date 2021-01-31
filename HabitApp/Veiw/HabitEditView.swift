//
//  HabitEditView.swift
//  HabitApp
//
//  Created by 竹村　太喜 on 2021/01/29.
//

import SwiftUI

struct HabitEditView: View {
    
    @ObservedObject var newList = NewList()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("何を習慣にしたいですか？")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    
                TextField("習慣を入れてください", text: $newList.newMessage)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .frame(width: 250.0)
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("補足メモ", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .frame(width: 250.0, height: 100.0)
                    .border(Color.black)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                    
                List {
                    ForEach(newList.messages, id: \.self) { habitData in
                        Text(habitData)
                    }.onDelete { offset in
                        self.newList.messages.remove(atOffsets: offset)
                    }
                    
                }
                
            
                Button(action: {
                    newList.messages.append(newList.newMessage)
                    newList.newMessage = ""
                    
                    
                }) {
                    Text("完了ボタン")
                    NavigationLink(destination: ContentView(newList: newList)){
                        Text("習慣追加ボタン")
                    }.padding(.all).border(Color.black)
                    
                    
                }
                
                
            }.navigationTitle("HabitEditView")
            
        }
        
        
    }
}

struct HabitEditView_Previews: PreviewProvider {
    static var previews: some View {
        HabitEditView()
    }
}
