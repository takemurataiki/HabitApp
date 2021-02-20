//
//  HabitEditView.swift
//  HabitApp
//
//  Created by 竹村　太喜 on 2021/01/29.
//

import SwiftUI

struct HabitEditView: View {

    
    @Environment(\.presentationMode) var presentation
    
//    @ObservedObject var countHabit: CountHabit()
//    @EnvironmentObject var countHabit: CountHabit
    
//    @ObservedObject var newList = NewList()
    @EnvironmentObject var newList: NewList
    
    @State var isShow: Bool = false
    
    
    var body: some View {
        
        
            VStack {

                Text("何を習慣にしたいですか？")
                    .font(.footnote)
                    .foregroundColor(.gray)
                
                TextField("習慣を入れてください", text: $newList.newTitle)
                    .frame(width: 250.0)
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("補足メモ", text: .constant(""))
                    .frame(width: 250.0, height: 100.0)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                NavigationLink(destination: ContentView(newList: _newList).environmentObject(self.newList),
                               isActive: $isShow)
                {
                            
                        }
                        
                        Button("ボタン",action: {
                            newList.listArray.append(ListData(title: newList.newTitle,count: 0))
                            newList.newTitle = ""
                            
                            newList.counts.append(newList.newCount)
                            newList.newCount = 0
                            
                            self.isShow = true
                            presentation.wrappedValue.dismiss()
                            
                        })
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        .border(Color.black)
                    
            }.navigationTitle("HabitEditView")
            .navigationBarTitleDisplayMode(.inline)
        }
    
}

struct HabitEditView_Previews: PreviewProvider {
    static var previews: some View {
        HabitEditView()
            .environmentObject(NewList())
            .environmentObject(CountHabit())
    }
}
