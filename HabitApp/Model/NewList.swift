//
//  NewList.swift
//  HabitApp
//
//  Created by 竹村　太喜 on 2021/03/28.
//

import Foundation
import SwiftUI

class NewList: ObservableObject {
    
    ///リストの配列
    @Published var listArray:[ListData] = makeData()    
    {
        didSet {
            
            UserDefaults.standard.setEncoded(listArray, forKey: "listArray")
            
        }
    }
    
    init() {
        
        listArray = UserDefaults.standard.decodedObject([ListData].self, forKey: "listArray") ?? []
        
    }

    ///テキスト初期化
    @Published var newTitle = ""

    
    /// 進捗
    @Published var progress: Float = 0

    ///テーマ色選択
    @Published var colors = [Color.purple, Color.red, Color.orange, Color.yellow, Color.green, Color.blue]
    
    ///色
    @Published var selectedColor: Color = .purple
    
    ///達成時刻初期値
    @Published var newTimeStamp = ""

    ///日付
    @Published var date = Date()

    var dateFormat1: DateFormatter {
        let df = DateFormatter()
        df.locale = Locale(identifier: "jp-JP")
        df.dateStyle = .full
        df.timeStyle = .short
        df.calendar = Calendar(identifier: .japanese)
        df.dateFormat = "M月dd日は完了しました！！"
        return df
    }
    
    ///表示の切り替え
    @Published var isShow: Bool = false

    ///foreachの引数を二つ取るための機能
    func rowReplace(_ from: IndexSet, _ to: Int){
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
    func delete() {
        UserDefaults.standard.removeObject(forKey: "delete")
    }
}

extension Collection {
  func indexed() -> Array<(offset: Int, element: Element)> {
    return Array(self.enumerated())
  }
    
}




