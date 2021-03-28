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
//    {
//        didSet
//        {
//                    UserDefaults.standard.set(id, forKey: "id")
//                }
//    }
    var title: String
//    {
//        didSet {
//                    UserDefaults.standard.set(title, forKey: "title")
//                }
//    }
    
    var count: Float
//    {
//        didSet {
//                    UserDefaults.standard.set(count, forKey: "count")
//                }
//    }
    
    var color: Color
//    {
//        didSet {
//                    UserDefaults.standard.set(color, forKey: "color")
//                }
//    }
    
    var timeStamp: String
//    {
//        didSet {
//                    UserDefaults.standard.set(timeStamp, forKey: "timeStamp")
//                }
//    }
    
    var isShow: Bool
//    {
//        didSet {
//                    UserDefaults.standard.set(isShow, forKey: "isShow")
//                }
//    }
//    title:String = "起床",count:Float = 12/360,color: Color = Color.red,timeStamp: String = "",isShow: Bool = false

//    init(title:String = "起床",count:Float = 12/360,color: Color = Color.red,timeStamp: String = "",isShow: Bool = false) {
//        self.id = UserDefaults.standard.object(forKey: "id") as? UUID ?? UUID()
//        self.title = UserDefaults.standard.string(forKey: "title") ?? ""
//        self.count = UserDefaults.standard.float(forKey: "count")
//        self.color = UserDefaults.standard.object(forKey: "color") as? Color ?? Color.blue
//        self.timeStamp = UserDefaults.standard.string(forKey: "timeStamp") ?? ""
//        self.isShow = UserDefaults.standard.bool(forKey: "isShow")
//
//    }
//
//     
    
   
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
//    {
//        didSet {
//                    UserDefaults.standard.set(listArray, forKey: "listArray")
//                }
//    }

    ///タイトル
    @Published var titles: [String] = []
//    {
//        didSet {
//                    UserDefaults.standard.set(titles, forKey: "titles")
//                }
//    }
//
    /// サブタイトル
    @Published var subTitles: [String] = []
//    {
//        didSet {
//                    UserDefaults.standard.set(subTitles, forKey: "subTitles")
//                }
//    }
    ///テキスト初期化
    @Published var newTitle = ""
//    {
//        didSet {
//                    UserDefaults.standard.set(newTitle, forKey: "newTitle")
//                }
//    }
    
    /// 進捗
    @Published var progress: Float = 0
//    {
//        didSet {
//                    UserDefaults.standard.set(progress, forKey: "progress")
//                }
//    }
    
    ///テーマ色
    @Published var colors = [Color.purple, Color.red, Color.orange, Color.yellow, Color.green, Color.blue]
//    {
//        didSet {
//                    UserDefaults.standard.set(colors, forKey: "colors")
//                }
//    }
//
    @Published var selectedColor: Color = .purple
//    {
//        didSet {
////                    UserDefaults.standard.set(selectedColor, forKey: "selectedColor")
//            if let components = selectedColor.cgColor?.components {
//                UserDefaults.standard.setValue(components[0], forKey: "RColor")
//                UserDefaults.standard.setValue(components[1], forKey: "GColor")
//                UserDefaults.standard.setValue(components[2], forKey: "BColor")
//                    }
//                }
//    }
    
    
    ///達成時刻初期値
    @Published var newTimeStamp = ""
//    {
//        didSet {
//                    UserDefaults.standard.set(newTimeStamp, forKey: "newTimeStamp")
//                }
//    }
//
    @Published var date = Date()
//    {
//        didSet {
//                    UserDefaults.standard.set(date, forKey: "date")
//                }
//    }
//
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
//    {
//
//        didSet {
//                    UserDefaults.standard.set(isShow, forKey: "isShow")
//                }
//    }
    
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
    
    
//    init() {
//        self.listArray = UserDefaults.standard.array(forKey: "listArray") as? [ListData] ?? []
//        self.titles = UserDefaults.standard.array(forKey: "titles") as? [String] ?? []
//        self.subTitles = UserDefaults.standard.array(forKey: "subTitles") as? [String] ?? []
//        self.newTitle = UserDefaults.standard.string(forKey: "newTitle") ?? ""
//        self.progress = UserDefaults.standard.float(forKey: "progress")
//        self.colors = UserDefaults.standard.array(forKey: "colors") as? [Color] ?? []
//        self.selectedColor = UserDefaults.standard.object(forKey: "selectedColor") as? Color ?? Color.blue
//        self.newTimeStamp = UserDefaults.standard.string(forKey: "newTimeStamp") ?? ""
//        self.date = UserDefaults.standard.object(forKey: "date") as? Date ?? Date()
//        self.isShow = UserDefaults.standard.bool(forKey: "isShow")
//
//    }



    
    
    
    
}


