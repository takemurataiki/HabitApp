//
//  HabitRecordSampleView.swift
//  HabitApp
//
//  Created by 竹村　太喜 on 2021/02/11.
//

import SwiftUI

struct HabitRecordView: View {
    let index : Int
    
    @Binding  var list:ListData
    @EnvironmentObject var newList: NewList
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        
        let td = newList.dateFormat1.string(from: newList.date)
        NavigationView {
            if (index < newList.listArray.count) {
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
//                            .animation(.default).animation(.default) // 線をAnimationさせる
                        VStack {
                            Text(list.title)
                                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                                .font(.title)
                                .foregroundColor(list.color)
                            // パーセント表示
                            Text("\(Int((min(Double(list.count), 1.0) * 100)/3.3))/30")
                                .font(.system(size: 25, weight: .black, design: .default))
                                .foregroundColor(list.color)
                            
                            Text(list.timeStamp)
                                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        }
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    }
                    
                    Spacer()
                    
                    

                    
                    ///習慣達成ボタン
                    Button(action:{
                        list.isShow = true
                        list.count += 12/360
                        
                        
                        if list.timeStamp == "" {
                            list.timeStamp = td
                        }
                        else if list.timeStamp != td {
                            list.timeStamp = td
                            
                        }
                            
                        
                                
                            }) {
                        Text("習慣完了ボタン")
                    }
                    .disabled(list.count >= 1 || list.timeStamp == td)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .font(.title2)
                    .foregroundColor(.white)
                    .cornerRadius(/*@START_MENU_TOKEN@*/15.0/*@END_MENU_TOKEN@*/)
                    .background(list.isShow ? Color.gray : list.color.opacity(0.8))
                    .shadow(radius: /*@START_MENU_TOKEN@*/6/*@END_MENU_TOKEN@*/)
                    
                    
                    Spacer()
                    
                    
                }
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
                    list.isShow = false
                    list.timeStamp = newList.newTimeStamp
//                    presentation.wrappedValue.dismiss()
                    
                            }) {
                    Image(systemName: "slash.circle")
                        .scaleEffect(1.5)
                }
                .disabled(list.count <= 0 || list.timeStamp == newList.newTimeStamp)
                
        )
    }
}

struct HabitRecordView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HabitRecordView(index: 0, list: .constant(ListData(title:"起床",count: 0.3,color: .purple,timeStamp: "", isShow: false)))
                .environmentObject(NewList())
            
        }
    }
}
