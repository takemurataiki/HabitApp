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
            VStack {
                NavigationLink(destination: HabitEditView()){
                    Text("習慣追加ボタン")
                    
                }.padding(.all).border(Color.black)
                
                
            
                NavigationLink(destination: HabitRecordView()){
                    Text("習慣記録ボタン")
                    
                }.padding(.all).border(Color.black)
                
            }.navigationTitle("ContentView")
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
