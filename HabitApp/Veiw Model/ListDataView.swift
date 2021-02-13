//
//  ListDataView.swift
//  HabitApp
//
//  Created by 竹村　太喜 on 2021/01/29.
//

import SwiftUI

struct ListDataView: View {
    @State var list:ListData
    @State var count = 0
    
    var body: some View {
        HStack {
            
            Text(String(list.count)+"/30")
            
            Text(list.title)
            Text(String(count)+"/30")
            
            
            
            
        }
    }
}

struct ListDataView_Previews: PreviewProvider {
    static var previews: some View {
        ListDataView(list: listArray[1])
            .previewLayout(.fixed(width: 350, height: 80))
    }
}
