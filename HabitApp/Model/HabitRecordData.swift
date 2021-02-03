//
//  HabitRecordData.swift
//  HabitApp
//
//  Created by 竹村　太喜 on 2021/02/03.
//

import Foundation


class CountHabit: ObservableObject {
    
    @Published var counter = 0
    
    
    func countUp() {
        counter += 1
        
    }
    
    func countDown() {
        counter += -1
        
    }
    
    
    
    
}

