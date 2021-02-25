//
//  HabitRecordSampleView.swift
//  HabitApp
//
//  Created by 竹村　太喜 on 2021/02/11.
//

import SwiftUI

struct HabitRecordSampleView: View {
    @Binding  var list:ListData
    
    @State private var progress: Float = 0
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack {
            Text(list.title)
            
            Spacer()
            
            ZStack {
                ProgressCircleVM(progress: $progress,
                                   lineColor: .blue,
                                   lineWidth: 25,
                                   lineCap:.butt,
                                   textColor: .blue,
                                   textFont: .system(size: 25, weight: .black, design: .default))
                    .frame(width:120, height: 120)
                    .padding()
                // パーセント
                Text("\(Int((min(Double(progress), 1.0) * 100)/3.3))/30")
                    .font(.system(size: 25, weight: .black, design: .default))
                    .foregroundColor(.blue)
            }
            
            Spacer()
            
            Text(String(list.count))
            
            Spacer()
            
            Button(action:{
                list.count += 1
                progress += 12/360
                presentation.wrappedValue.dismiss()
                        
                    }) {
                Text("習慣追加ボタン")
            }.disabled(list.count >= 30)
            
            
            Button(action:{
                list.count -= 1
                progress -= 12/360
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
                .environmentObject(NewList())
            
        }
    }
}
