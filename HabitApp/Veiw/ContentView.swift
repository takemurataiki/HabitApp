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
            ZStack (alignment: .bottomTrailing){
                ///習慣リスト一覧
                List {
                        ForEach(newList.listArray.indexed(), id: \.1.id) { index, habitData in
                            NavigationLink(destination: HabitRecordView(index: index, list: $newList.listArray[index])
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
                        .onDelete { offset in
                            self.newList.listArray.remove(atOffsets: offset)
                        }
                        ///リスト並び替え
                        .onMove(perform: newList.rowReplace)
                        
                    }
                ///謎の空白を埋める
                .listStyle(PlainListStyle())
                
                
                
                ///習慣追加ボタン
                NavigationLink(destination: HabitEditView(selectedColor: .purple)){
                    Image(systemName: "plus.circle.fill")
                        .scaleEffect(4)
                        .frame(width: 100, height: 100, alignment: .center)
                        
                        
                    
                }
                .padding([.bottom, .trailing],25)
                
                
                
            }
            .navigationBarTitle("習慣リスト", displayMode: .inline)
            
            .navigationBarItems(
                leading:
                    HStack {
                        
                    },
                trailing:
                    EditButton()
            )
            
            
            
            
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
