//
//  ListData.swift
//  HabitApp
//
//  Created by 竹村　太喜 on 2021/01/29.
//

import Foundation
import SwiftUI

var listArray:[ListData] = makeData()

struct ListData: Identifiable {
    var id = UUID()
    var title: String
    var count: Float
    var color: Color
    var timeStamp: String
    var isShow: Bool
    
    
}

func makeData() -> [ListData] {
    var dataArray:[ListData] = []
    dataArray.append(ListData(title:"起床",count: 12/360,color: Color.red,timeStamp: "",isShow: false))
    dataArray.append(ListData(title:"朝食",count: 24/360,color: Color.blue,timeStamp: "",isShow: false))
    
    
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
    
    /// 進捗
    @Published var progress: Float = 0
    
    ///テーマ色
    @Published var colors = [Color.purple, Color.red, Color.orange, Color.yellow, Color.green, Color.blue]
    
    @Published var selectedColor: Color = .purple
    
    
    ///達成時刻初期値
    @Published var newTimeStamp = ""
    
    @Published var date = Date()
    
    var dateFormat1: DateFormatter {
        let df = DateFormatter()
        df.locale = Locale(identifier: "jp-JP")
        df.dateStyle = .full
        df.timeStyle = .short
        df.calendar = Calendar(identifier: .japanese)
        df.dateFormat = "M/dd"
        return df
    }
    
    
    
    
    
    ///表示の切り替え
    @Published var isShow: Bool = false
    ///foreachの引数を二つ取るための機能
    func rowReplace(_ from: IndexSet, _ to: Int) {
            listArray.move(fromOffsets: from, toOffset: to)
        }
    
    ///文字数チェック
    func countCheck() {
        if (newTitle.count < 1 || newTitle.count > 30) {
            isShow = true

        }
        else {
            isShow = false
        }
    }
    
    
    
    
}


