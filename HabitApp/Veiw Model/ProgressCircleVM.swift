//
//  ProgressCircleVM.swift
//  HabitApp
//
//  Created by 竹村　太喜 on 2021/02/25.
//

import SwiftUI

struct ProgressCircleVM: View {
    
    @EnvironmentObject var newList: NewList
    
    /// 進捗
    var progress: Float = 0
    
    /// 線の色
    let lineColor: Color
    /// 線の太さ
    let lineWidth: CGFloat
    /// 線の端
    let lineCap: CGLineCap
    /// 文字の色
    let textColor: Color
    /// 文字の書式
    let textFont: Font?
    
    var body: some View {
        ZStack {
            // 薄い円
            Circle()
                .stroke(lineColor, lineWidth: lineWidth)
                .opacity(0.2)
                
            
            // 進捗の円
            Circle()
                .trim(from: 0, to: CGFloat(min(progress,1.0))) // 線の長さを指定
                .stroke(lineColor, style: StrokeStyle(lineWidth: lineWidth,lineCap: lineCap))
                .rotationEffect(.degrees(-90.0)) // 線を上から開始させる
//                .animation(.easeInOut) // 線をAnimationさせる
//                .transition(.identity)
                
        }
    }
}



struct ProgressCircleVM_Previews: PreviewProvider {
    static var previews: some View {
        ProgressCircleVM(
            progress: 0.3,
            lineColor: .blue,
            lineWidth: 25,
            lineCap:.butt,
            textColor: .blue,
            textFont: .system(size: 25, weight: .black, design: .default))
            .environmentObject(NewList())

    }
}
