//
//  ContentView.swift
//  HabitApp
//
//  Created by 竹村太喜 on 2021/01/26.
//

import SwiftUI

struct ContentView: View {
    
    @State var count:Int = 0
    
    
//    @ObservedObject var newList:NewList
    @EnvironmentObject var newList: NewList

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    
                    ///習慣追加ボタン
                    NavigationLink(destination: HabitEditView()){
                        Text("習慣追加ボタン")
                    }.padding(.all).border(Color.black)
                    
                }
                ///習慣リスト一覧
                List {
                    ForEach(newList.listArray.indexed(), id: \.1.id) { index, habitData in
                        NavigationLink(destination: HabitRecordView(list: $newList.listArray[index])
                        ) {
                            ///グラフ
                            ZStack {
                                ///円グラフ
                                ProgressCircleVM(progress: habitData.count,
                                                 lineColor: habitData.color,
                                                   lineWidth: 15,
                                                   lineCap:.butt,
                                                   textColor: .blue,
                                                   textFont: .system(size: 25, weight: .black, design: .default))
                                    .frame(width:60, height: 60)
                                    .padding()
                                /// パーセント表示
                                Text("\(Int((min(Double(habitData.count), 1.0) * 100)/3.3))")
                                    .font(.system(size: 25, weight: .black, design: .default))
                                    .foregroundColor(habitData.color)
                            }
                            
                            ///タイトル
                            Text(habitData.title)
                            ///達成日数
                            Text("\(Int((min(Double(habitData.count), 1.0) * 100)/3.3))/30")
                            
                            
                        }
                    }
                    ///リスト削除
                    .onDelete { offset in
                        self.newList.listArray.remove(atOffsets: offset)
                    }
                    ///リスト並び替え
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
//            .environmentObject(CountHabit())
            
    }
}
