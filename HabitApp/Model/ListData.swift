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
    var count:Float
    
}

func makeData() -> [ListData] {
    var dataArray:[ListData] = []
    dataArray.append(ListData(title:"起床",count: 12/360))
    dataArray.append(ListData(title:"朝食",count: 24/360))
    
    
    return dataArray
}

extension Collection {
  func indexed() -> Array<(offset: Int, element: Element)> {
    return Array(self.enumerated())
  }
}




class NewList: ObservableObject {
    ///リストの配列
    @Published var listArray:[ListData] = makeData()
    ///タイトル
    @Published var titles: [String] = []
    /// サブタイトル
    @Published var subTitles: [String] = []
    ///テキスト初期化
    @Published var newTitle = ""
    
    ///継続日数
    @Published var counts:[Int] = []
    ///継続日数初期値
    @Published var newCount = 0
    //習慣記録日数初期値
    @Published var counter = 0
    
    ///習慣達成
    func countUp() {
        counter += 1
    }
    ///習慣取消し
    func countDown() {
        counter += -1
    }
    
    /// 進捗
    @Published var progress: Float = 0
    
    ///表示の切り替え
    @Published var isShow: Bool = false
    ///foreachの引数を二つ取るための機能
    func rowReplace(_ from: IndexSet, _ to: Int) {
            listArray.move(fromOffsets: from, toOffset: to)
        }
    
    
    
}


