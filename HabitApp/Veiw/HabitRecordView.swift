//
//  HabitRecordView.swift
//  HabitApp
//
//  Created by 竹村　太喜 on 2021/01/29.
//

import SwiftUI

struct HabitRecordView: View {
    var habitName: String = "習慣リスト"
    
    @State var num = 0
    
    var body: some View {
        NavigationView {
            VStack {
                Text(habitName)
                Spacer()
                HStack {
                    Button(action: {
                            num += 1}) {
                        Text("習慣達成！")
                    }
                    Button(action: {
                            num -= 1}) {
                        Text("習慣取消し！")
                    }
                    
                }
                Text("\(num)")
                Spacer()
            }.navigationTitle("HabitRecordView")
        }
    }
}

struct HabitRecordView_Previews: PreviewProvider {
    static var previews: some View {
        HabitRecordView()
    }
}
