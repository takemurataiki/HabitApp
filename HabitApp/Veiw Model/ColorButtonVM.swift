//
//  HabitRecordView.swift
//  HabitApp
//
//  Created by 竹村　太喜 on 2021/01/29.
//

import SwiftUI

struct ColorButtonVM: View {
    
    @State var selectedColor = 0
    
    @EnvironmentObject var newList: NewList
    
    @Environment(\.presentationMode) var presentation

    var body: some View {
        NavigationView {
            VStack {
                    Text("a")
                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Content@*/Text("Button")/*@END_MENU_TOKEN@*/
                }
                HStack {
                    Picker(selection: $selectedColor, label: Text("Color")) {
                        Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                            Text("Red")
                        }
                        .tag(0)
                        
                        
                        Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                            Text("Blue")
                        }
                        .tag(1)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        
                        Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                            Text("Green")
                        }
                        .tag(2)
                        .padding(.all)
                        
                        Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                            Text("Yellow")
                        }
                        .tag(3)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        
                        Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                            Text("Purple")
                        }
                        .tag(4)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        
                        

                    }
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .frame(width: 200.0)
                    .pickerStyle(SegmentedPickerStyle())
                    
                    
                    ProgressCircleVM(
                        progress: 1,
                        lineColor: newList.colors[selectedColor],
                        lineWidth: 15,
                        lineCap:.butt,
                        textColor: .blue,
                        textFont: .system(size: 25, weight: .black, design: .default))
                        .frame(width: 50.0, height: 50.0)
                }

              

            }
            
        }

    }
}

struct ColorButtunVM_Previews: PreviewProvider {
    static var previews: some View {
        ColorButtonVM()
            .environmentObject(NewList())

    }
}
