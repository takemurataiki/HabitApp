//
//  HabitRecordSampleView.swift
//  HabitApp
//
//  Created by 竹村　太喜 on 2021/02/11.
//

import SwiftUI

struct HabitRecordView: View {
    @Binding  var list:ListData
    
    
    
    @EnvironmentObject var newList: NewList
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        NavigationView {
            VStack {
                
                ///グラフ
                ZStack {
                    ///円グラフ
                    ProgressCircleVM(progress: list.count,
                                     lineColor: list.color,
                                       lineWidth: 25,
                                       lineCap:.butt,
                                       textColor: list.color,
                                       textFont: .system(size: 25, weight: .black, design: .default))
                        .padding(/*@START_MENU_TOKEN@*/.all, 40.0/*@END_MENU_TOKEN@*/)
                    VStack {
                        Text(list.title)
                            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                            .font(.title)
                            .foregroundColor(list.color)
                        // パーセント表示
                        Text("\(Int((min(Double(list.count), 1.0) * 100)/3.3))/30")
                            .font(.system(size: 25, weight: .black, design: .default))
                            .foregroundColor(list.color)
                    }
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                }
                
                Spacer()
                
                

                
                ///習慣達成ボタン
                Button(action:{
                    list.count += 12/360
                    
                            
                        }) {
                    Text("習慣完了ボタン")
                }
                .disabled(list.count >= 1)
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .font(.title2)
                .foregroundColor(.white)
                .background(list.color.opacity(0.8))
                .cornerRadius(/*@START_MENU_TOKEN@*/15.0/*@END_MENU_TOKEN@*/)
                .shadow(radius: /*@START_MENU_TOKEN@*/6/*@END_MENU_TOKEN@*/)
                
                Spacer()
                
                
            }
        }
        ///リストのタイトル
        .navigationTitle("記録する")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(
            trailing:
                ///習慣取消しボタン
                Button(action:{
                    list.count -= 12/360
                    presentation.wrappedValue.dismiss()
                    
                            }) {
                    Image(systemName: "slash.circle")
                        .scaleEffect(1.5)
                }
                .disabled(list.count <= 0)
                
        )
    }
}

struct HabitRecordView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HabitRecordView(list: .constant(ListData(title:"起床",count: 0.3,color: .purple)))
                .environmentObject(NewList())
            
        }
    }
}
