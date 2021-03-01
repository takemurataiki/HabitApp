//
//  HabitRecordView.swift
//  HabitApp
//
//  Created by 竹村　太喜 on 2021/01/29.
//

import SwiftUI

struct ColorButtonVM: View {
    @State var selectedColor: Color
    
    @EnvironmentObject var newList: NewList
    
    var body: some View {
        VStack {
            HStack {
                ForEach(newList.colors, id:  \.description) { color in
                        CheckBox(selectedColor: self.$selectedColor, color: color)
                }.padding(.all)
                    
            }
        }
        
    }
}

struct CheckBox: View {

    @Binding var selectedColor: Color
    var color: Color

    var body: some View {
        Button(action: { self.selectedColor = self.color }) {
            Image(systemName: self.selectedColor == color ? "largecircle.fill.circle" : "circle.fill")
                .scaleEffect(1.5)
                .opacity(0.8)
                
                
                
        }
        .accentColor(self.color)
        
        
    }
}

struct ColorButtunVM_Previews: PreviewProvider {
    static var previews: some View {
        ColorButtonVM(selectedColor: .purple)
            .environmentObject(NewList())

    }
}
