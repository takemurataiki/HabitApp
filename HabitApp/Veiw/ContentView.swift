//
//  ContentView.swift
//  HabitApp
//
//  Created by 竹村太喜 on 2021/01/26.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var newList = NewList()
    
    var body: some View {
        
        NavigationView {
            VStack(alignment: .center) {
                NavigationLink(destination: HabitEditView()){
                    Text("習慣追加ボタン")
                }.padding(.all).border(Color.black)
                
                List {
                    ForEach(newList.messages, id: \.self) { habit in
                        Text(habit)
                    }.onDelete { offset in
                        self.newList.messages.remove(atOffsets: offset)
                    }
                }
            }
            .navigationTitle("ContentView")
            .navigationBarTitleDisplayMode(.inline)
            
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
