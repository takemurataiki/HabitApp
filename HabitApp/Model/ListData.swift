//
//  ListData.swift
//  HabitApp
//
//  Created by 竹村　太喜 on 2021/01/29.
//

import Foundation

var listArray:[ListData] = makeData()


struct ListData: Identifiable {
    var id:Int
    var title:String
    
}

func makeData() -> [ListData] {
    var dataArray:[ListData] = []
    dataArray.append(ListData(id:1, title:"起床"))
    dataArray.append(ListData(id:2, title:"朝食"))
    dataArray.append(ListData(id:3, title:"昼食"))
    dataArray.append(ListData(id:4, title:"夕食"))
    dataArray.append(ListData(id:5, title:"就寝"))
    
    return dataArray
}
