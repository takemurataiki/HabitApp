//
//  ListData.swift
//  HabitApp
//
//  Created by 竹村　太喜 on 2021/01/29.
//

import Foundation
import SwiftUI

struct ListData: Codable,Identifiable {
    var id = UUID()
    var title: String
    var count: Float
    var color: Color
    var timeStamp: String
    var isShow: Bool

    init(title:String ,count:Float ,color: Color ,timeStamp: String ,isShow: Bool) {
        self.title = title
        self.color = color
        self.count = count
        self.timeStamp = timeStamp
        self.isShow = isShow
    }
    
}

///Codable対応変換
extension ListData {
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
                color = try container.decode(Color.self, forKey: .color)
                timeStamp = try container.decode(String.self, forKey: .timeStamp)
                isShow = try container.decode(Bool.self, forKey: .isshow)
            }
        
        /// ③プロパティのencode（コード化）アクション
            func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encode(id, forKey: .id)
                try container.encode(title, forKey: .title)
                try container.encode(count, forKey: .count)
                try container.encode(color, forKey: .color)
                try container.encode(timeStamp, forKey: .timeStamp)
                try container.encode(isShow, forKey: .isshow)
                
            }
    
}

func makeData() -> [ListData] {
    var dataArray:[ListData] = []
//    {
//        didSet {
//            UserDefaults.standard.setEncoded(dataArray, forKey: "dataArray")
//        }
//    }
    dataArray.append(ListData(title:"起床",count: 12/360,color: Color.red,timeStamp: "",isShow: false))
    dataArray.append(ListData(title:"朝食",count: 24/360,color: Color.blue,timeStamp: "",isShow: false))
    
//    UserDefaults.standard.setEncoded(dataArray, forKey: "dataArray")
//    dataArray = UserDefaults.standard.decodedObject([ListData].self, forKey: "dataArray") ?? []
    
    
    return dataArray
}



extension UserDefaults {
    ///保存
  func setEncoded<T: Encodable>(_ value: T, forKey key: String) {
    guard let data = try? JSONEncoder().encode(value) else {
       print("Can not Encode to JSON.")
       return
    }

    set(data, forKey: key)
  }

    ///取り出し
  func decodedObject<T: Decodable>(_ type: T.Type, forKey key: String) -> T? {
    guard let data = data(forKey: key) else {
      return nil
    }

    return try? JSONDecoder().decode(type, from: data)
  }
}


