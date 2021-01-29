//
//  ContentView.swift
//  HabitApp
//
//  Created by 竹村太喜 on 2021/01/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                NavigationLink(destination: HabitEditView()){
                    Text("習慣追加ボタン")
                    
                }.padding(.all).border(Color.black)
                
                
                List(listArray) { item in
                    NavigationLink(destination: HabitRecordView()){
                        ListDataView(list: item)
                    
                }
                    
                }.padding(.all).border(Color.black)
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
