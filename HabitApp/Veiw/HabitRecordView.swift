//
//  HabitRecordView.swift
//  HabitApp
//
//  Created by 竹村　太喜 on 2021/01/29.
//

import SwiftUI

struct HabitRecordView: View {
    @State var habitName: String = "習慣リスト"
    @State var flug: Bool = false
    
    @EnvironmentObject var countHabit: CountHabit
    
    
//    @ObservedObject var countHabit = CountHabit()
    
    var body: some View {
       
            VStack {
                Text(habitName)
                Spacer()
                
                Text("\(self.countHabit.counter)")
                
                
                Spacer()
                
//                NavigationLink(destination: ContentView(countHabit: countHabit),isActive: $flug) {
//
//                }
                
                Button(action:{
                    countHabit.countUp()
                    self.flug = true
                            
                        }) {
                    Text("習慣追加ボタン")
                }.disabled(countHabit.counter >= 30)
                
                
                Button(action:{
                    countHabit.countDown()
                    
                            }) {
                    Text("習慣取消しボタン")
                }.disabled(countHabit.counter <= 0)
                
                
                
                Spacer()
                
            }.navigationTitle("HabitRecordView")
        
    }
}

struct HabitRecordView_Previews: PreviewProvider {
    static var previews: some View {
        HabitRecordView()
            .environmentObject(CountHabit())
    }
}
