//
//  ContentView.swift
//  HabitApp
//
//  Created by 竹村太喜 on 2021/01/26.
//

import SwiftUI

struct ContentView: View {
    
    @State var count:Int = 0
    @State private var progress: Float = 0
    
//    @ObservedObject var newList:NewList
//    @ObservedObject var countHabit = CountHabit()
    
    @EnvironmentObject var newList: NewList
//    @EnvironmentObject var countHabit: CountHabit
    
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    
                    NavigationLink(destination: HabitEditView()){
                        Text("習慣追加ボタン")
                        
                    }.padding(.all).border(Color.black)
                    
                }
                
                List {
                    ForEach(newList.listArray.indexed(), id: \.1.id) { index, habitData in
                        NavigationLink(destination: HabitRecordSampleView(list: $newList.listArray[index], progress: $progress )
                                        .environmentObject(self.newList)
                                        
                        ) {
                            ZStack {
                                ProgressCircleVM(progress: progress,
                                                   lineColor: .blue,
                                                   lineWidth: 15,
                                                   lineCap:.butt,
                                                   textColor: .blue,
                                                   textFont: .system(size: 25, weight: .black, design: .default))
                                    .frame(width:60, height: 60)
                                    .padding()
                                // パーセント
                                Text("\(Int((min(Double(progress), 1.0) * 100)/3.3))")
                                    .font(.system(size: 25, weight: .black, design: .default))
                                    .foregroundColor(.blue)
                            }
                            
                            Text(habitData.title)
                            Text("\(habitData.count)/30")
                            
                            
                        }
                    }
                    .onDelete { offset in
                        self.newList.listArray.remove(atOffsets: offset)
                    }
                    .onMove(perform: newList.rowReplace)
                    
                }
            
                
            }
            .navigationTitle("ContentView")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: EditButton())
            
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
