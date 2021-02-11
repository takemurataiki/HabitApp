//
//  ContentView.swift
//  HabitApp
//
//  Created by 竹村太喜 on 2021/01/26.
//

import SwiftUI

struct ContentView: View {
    
//    @ObservedObject var newList = NewList()
//    @ObservedObject var countHabit = CountHabit()
    
    @EnvironmentObject var newList: NewList
//    @EnvironmentObject var countHabit: CountHabit
    
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                HStack {
                    EditButton()
                        .padding()
                    NavigationLink(destination: HabitEditView()){
                        Text("習慣追加ボタン")
                        
                    }.padding(.all).border(Color.black)
                    
                }
                
                List {
                    ForEach(newList.titles, id: \.self) { habitData in
                        NavigationLink(destination: HabitRecordView(habitName: habitData)) {
                            Text(habitData)
                            Text("\(newList.counter)/30").border(Color.black)
                        }
                    }.onDelete { offset in
                        self.newList.titles.remove(atOffsets: offset)
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
            .environmentObject(NewList())
            .environmentObject(CountHabit())
    }
}
