//
//  HabitRecordSampleView.swift
//  HabitApp
//
//  Created by 竹村　太喜 on 2021/02/11.
//

import SwiftUI

struct HabitRecordSampleView: View {
    @Binding  var list:ListData
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack {
            Spacer()
            Text(list.title)
            
            Spacer()
            
            Text(String(list.count))
            
            Spacer()
            
            Button(action:{
                list.count += 1
                presentation.wrappedValue.dismiss()
                        
                    }) {
                Text("習慣追加ボタン")
            }.disabled(list.count >= 30)
            
            
            Button(action:{
                list.count -= 1
                presentation.wrappedValue.dismiss()
                
                        }) {
                Text("習慣取消しボタン")
            }.disabled(list.count <= 0)
            
            
            
            Spacer()
        }
    }
}

struct HabitRecordSampleView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HabitRecordSampleView(list: .constant(ListData(title:"起床",count: 1)))
            
        }
    }
}
