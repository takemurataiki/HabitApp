//
//  HabitRecordSampleView.swift
//  HabitApp
//
//  Created by 竹村　太喜 on 2021/02/11.
//

import SwiftUI

struct HabitRecordSampleView: View {
    @State var list:ListData
    
    var body: some View {
        VStack {
            Spacer()
            Text(list.title)
            
            Spacer()
            
            Text(String(list.count))
            
            
            Spacer()
            
            
            Button(action:{
                list.count += 1
                        
                    }) {
                Text("習慣追加ボタン")
            }.disabled(list.count >= 30)
            
            
            Button(action:{
                list.count -= 1
                
                        }) {
                Text("習慣取消しボタン")
            }.disabled(list.count <= 0)
            
            
            
            Spacer()
        }
    }
}

struct HabitRecordSampleView_Previews: PreviewProvider {
    static var previews: some View {
        HabitRecordSampleView(list: listArray[0])
    }
}
