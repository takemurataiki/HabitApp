//
//  ListDataView.swift
//  HabitApp
//
//  Created by 竹村　太喜 on 2021/01/29.
//

import SwiftUI

struct ListDataView: View {
    var list:ListData
    
    var body: some View {
        HStack {
            
            Text(list.title)
            Text(String(list.id))
            
            
            
        }
        
        
        
    }
}

struct ListDataView_Previews: PreviewProvider {
    static var previews: some View {
        ListDataView(list: listArray[0])
            .previewLayout(.fixed(width: 350, height: 80))
    }
}
