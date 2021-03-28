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
//
//        self.title = UserDefaults.standard.string(forKey: "title") ?? ""
//        self.count = UserDefaults.standard.object(forKey: "count") as? Float ?? 12/360
//        self.color = UserDefaults.standard.object(forKey: "color") as? Color ?? Color.purple
//        self.timeStamp = UserDefaults.standard.string(forKey: "timeStamp") ?? ""
//        self.isShow = UserDefaults.standard.object(forKey: "isShow") as? Bool ?? false
//
//    }

     
    
   
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




