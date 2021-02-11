//
//  HabitRecordData.swift
//  HabitApp
//
//  Created by 竹村　太喜 on 2021/02/03.
//

import Foundation


class CountHabit: ObservableObject {
    
    @Published var counter = 0 //習慣記録日数初期値
    
    func countUp() {
        counter += 1
    } //習慣達成
    
    func countDown() {
        counter += -1
    } //習慣取消し
    
    
}

