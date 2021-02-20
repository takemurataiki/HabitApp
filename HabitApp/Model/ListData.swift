//
//  ListData.swift
//  HabitApp
//
//  Created by 竹村　太喜 on 2021/01/29.
//

import Foundation

var listArray:[ListData] = makeData()


struct ListData: Identifiable {
    var id = UUID()
    var title:String
    var count:Int
    
}

func makeData() -> [ListData] {
    var dataArray:[ListData] = []
    dataArray.append(ListData(title:"起床",count: 1))
    dataArray.append(ListData(title:"朝食",count: 3))
    
    
    return dataArray
}

extension Collection {
  func indexed() -> Array<(offset: Int, element: Element)> {
    return Array(self.enumerated())
  }
}


class NewList: ObservableObject {
    @Published var listArray:[ListData] = makeData() //リストの配列
    
    @Published var titles: [String] = [] //タイトル
    @Published var subTitles: [String] = [] // サブタイトル
    @Published var newTitle = "" //テキスト初期化
    
    @Published var isShow: Bool = false
    
    @Published var counts:[Int] = []
    @Published var newCount = 0
    
    @Published var counter = 0 //習慣記録日数初期値
    
    
    func countUp() {
        counter += 1
    } //習慣達成
    
    func countDown() {
        counter += -1
    } //習慣取消し
    
    
    
}


