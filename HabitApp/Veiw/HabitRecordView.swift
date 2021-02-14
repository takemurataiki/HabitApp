//
//  HabitRecordView.swift
//  HabitApp
//
//  Created by 竹村　太喜 on 2021/01/29.
//

import SwiftUI

struct HabitRecordView: View {
    @State var habitName: String = "習慣リスト"
    @State var count:Int = 0
    
//    @Binding var hCount: Int
    
//    @ObservedObject var newList = NewList()
//    @ObservedObject var countHabit = CountHabit()
    
    @EnvironmentObject var newList: NewList
//    @EnvironmentObject var countHabit: CountHabit
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        NavigationView {
            VStack {
                    Text(habitName)
                    
                    Spacer()
                    
    //                Text("\(hCount)")
                    Text("\(count)")
                    Text("\(newList.newCount)")
                    
                    
                    Spacer()
                    
//                    NavigationLink(destination: ContentView(newList: _newList)) {
//                                Text("contenview")
//                            }
    //
                    Button(action:{
    //                    newList.countUp()
    //                    hCount += 1
                        count += 1
                        newList.newCount += 1
                        
    //                    presentation.wrappedValue.dismiss()
                                
                            }) {
                        Text("習慣追加ボタン")
                    }.disabled(count >= 30)
                    
                    
                    Button(action:{
    //                    hCount += -1
                        count += -1
                                }) {
                        Text("習慣取消しボタン")
                    }.disabled(count <= 0)
                    
                    
                    
                    Spacer()
                    
            }
            .navigationTitle("HabitRecordView")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

struct HabitRecordView_Previews: PreviewProvider {
    static var previews: some View {
        HabitRecordView( //hCount: .constant(0)
            )
            .environmentObject(CountHabit())
            .environmentObject(NewList())
            
    }
}
