//
//  ContentView.swift
//  HabitApp
//
//  Created by 竹村太喜 on 2021/01/26.
//

import SwiftUI

struct ContentView: View {
    
    @State var count:Int = 0
    
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
                        NavigationLink(destination: HabitRecordView(habitName: habitData
                        )) {
                            Text(habitData)
                            Text("\(newList.newCount)/30").border(Color.black)
                            
                        }
                    }
                    .onDelete { offset in
                        self.newList.titles.remove(atOffsets: offset)
                    }
                    
                }
                List {
                    ForEach(newList.counts, id: \.self) { habitCount in
                        let count = habitCount
                        NavigationLink(destination: HabitRecordView(count: habitCount)) {
                            Text("\(count)/30").border(Color.black)
                        }
                    }
                    .onDelete { offset in
                        self.newList.titles.remove(atOffsets: offset)
                    }
                    
                }
//                List(listArray) { item in
//                    NavigationLink(destination: HabitRecordSampleView(list: item, sampleCount: $count)) {
//                        ListDataView(list: item)
//                    }
//                    
//                }
                
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
