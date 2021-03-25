//
//  SendButton.swift
//  HabitApp
//
//  Created by 竹村　太喜 on 2021/03/23.
//

import SwiftUI

struct StringCountV: View {
    @State var chatMessage: String = ""
    @EnvironmentObject var newList: NewList
    
    var body: some View {
        HStack {
            TextField("replay",text: $newList.newTitle)
                
            SendButton(action: sendMessage, isDisabled: newList.newTitle.isEmpty)
        }
            
            .accentColor(.orange)
    }

    func sendMessage() {
        newList.newTitle = ""
        
    }
}

struct SendButton: View {
    let action: () -> ()
    let isDisabled: Bool

    var body: some View {
            Button(action: {
                withAnimation {
                    self.action()
                    
                }
            }) {
                Image(systemName: "arrow.up.circle")
                    
            }
                .disabled(isDisabled)
    }

    
}

struct StringCountV_Previews: PreviewProvider {
    static var previews: some View {
        StringCountV()
            .environmentObject(NewList())
            
    }
}
