//
//  HabitEditView.swift
//  HabitApp
//
//  Created by 竹村　太喜 on 2021/01/29.
//

import SwiftUI

struct HabitEditView: View {
    
    @ObservedObject var newList = NewList()
    
    @State var flug: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                
                Text("何を習慣にしたいですか？")
                    .font(.footnote)
                    .foregroundColor(.gray)
                
                TextField("習慣を入れてください", text: $newList.newMessage)
                    
                    .frame(width: 250.0)
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("補足メモ", text: .constant(""))
                    .frame(width: 250.0, height: 100.0)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                List {
                    ForEach(newList.messages, id: \.self) { habitData in
                        NavigationLink(destination: HabitRecordView(habitName: habitData)) {
                            Text(habitData)
                        }
                    }.onDelete { offset in
                        self.newList.messages.remove(atOffsets: offset)
                    }
                    
                }
                
                    NavigationLink(destination: ContentView(newList: newList),isActive: $flug) {
                        
                    }
                    
                    Button("ボタン",action: {
                        newList.messages.append(newList.newMessage)
                        newList.newMessage = ""
                        self.flug = true    
                        
                        
                    })
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .border(Color.black)
                    
                    
                
                
                
                
                
            }.navigationTitle("HabitEditView")
            
        }
        
        
    }
}

struct HabitEditView_Previews: PreviewProvider {
    static var previews: some View {
        HabitEditView()
    }
}
