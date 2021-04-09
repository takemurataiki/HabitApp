//
//  ListData.swift
//  HabitApp
//
//  Created by 竹村　太喜 on 2021/01/29.
//

import Foundation
import SwiftUI

struct ListData: Identifiable, Codable {
    
        
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
//
    var isShow: Bool
//    {
//        didSet {
//                    UserDefaults.standard.set(isShow, forKey: "isShow")
//                }
//    }
    
//    title:String = "起床",count:Float = 12/360,color: Color = Color.red,timeStamp: String = "",isShow: Bool = false

//    init(title:String ,count:Float ,color: Color ,timeStamp: String ,isShow: Bool) {
//
//        self.title = UserDefaults.standard.string(forKey: "title") ?? ""
//        self.count = UserDefaults.standard.float(forKey: "count")
//        self.color = UserDefaults.standard.object(forKey: "color") as? Color ?? Color.purple
//        self.timeStamp = UserDefaults.standard.string(forKey: "timeStamp") ?? ""
//        self.isShow = UserDefaults.standard.bool(forKey: "isShow")
//
//    }
    
    
    
    init(title:String ,count:Float ,color: Color ,timeStamp: String ,isShow: Bool) {

        self.title = title
        self.color = color
        self.count = count
        self.timeStamp = timeStamp
        self.isShow = isShow

        
    }
    
    
}



func ListDataSave() {
    /// 保存
    let valueToSave = ListData(title: "", count: 0, color: .purple, timeStamp: "", isShow: false)
    let encoder = JSONEncoder()
    if let encodedValue = try? encoder.encode(valueToSave) {
        UserDefaults.standard.set(encodedValue, forKey: "ListData")
    }
    
    /// 読み込み
    if let savedValue = UserDefaults.standard.data(forKey: "ListData") {
        
        let decoder = JSONDecoder()
        if let value = try? decoder.decode([ListData].self, from: savedValue) {
            print(value)    // User(name: "capibara", age: 20)
        }
    } else {
        /// 値がない場合の処理
        print("Error")
    }
    
}

extension NewList {
    
}






extension ListData {
    ///Codable対応変換
        /// ①変換対象プロパティ指定
            enum CodingKeys: CodingKey {
                case id
                case title
                case count
                case color
                case timeStamp
                case isshow
            }
        
        /// ②プロパティのdecode（復号化）アクション
            init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                id = try container.decode(UUID.self, forKey: .id)
                title = try container.decode(String.self, forKey: .title)
                count = try container.decode(Float.self, forKey: .count)
                color = try container.decode(Colors.self, forKey: .color).uiColor
                timeStamp = try container.decode(String.self, forKey: .timeStamp)
                isShow = try container.decode(Bool.self, forKey: .isshow)
            }
        
        /// ③プロパティのencode（コード化）アクション
            func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encode(id, forKey: .id)
                try container.encode(title, forKey: .title)
                try container.encode(count, forKey: .count)
                try container.encode(Colors(uiColor: color), forKey: .color)
                try container.encode(timeStamp, forKey: .timeStamp)
                
            }
    
}


func makeData() -> [ListData] {
    var dataArray:[ListData] = []
    dataArray.append(ListData(title:"起床",count: 12/360,color: Color.red,timeStamp: "",isShow: false))
    dataArray.append(ListData(title:"朝食",count: 24/360,color: Color.blue,timeStamp: "",isShow: false))
    
    
    return dataArray
}

struct ColorData : Codable {
    var red : CGFloat = 0.0
    var green: CGFloat = 0.0
    var blue: CGFloat = 0.0
    var alpha: CGFloat = 0.0

    var uiColor : UIColor {
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }

    init(uiColor : UIColor) {
        uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
    }
}

