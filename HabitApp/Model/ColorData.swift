//
//  ColorData.swift
//  HabitApp
//
//  Created by 竹村　太喜 on 2021/04/03.
//

import Foundation
import SwiftUI

#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif


struct Colors : Codable {
    
    var red : CGFloat = 0.0
    var green: CGFloat = 0.0
    var blue: CGFloat = 0.0
    var alpha: CGFloat = 0.0
    
    

    var uiColor1 : UIColor {
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    var uiColor : Color {
        return Color(UIColor(red: red, green: green, blue: blue, alpha: alpha))
    }
    
    

    init(uiColor : Color) {
        _ = Color(UIColor(red: red, green: green, blue: blue, alpha: alpha))
    }
}



//struct Task: Codable {
//
//
//    var content: String
//    var deadline: Date
//    var color1 : UIColor
//
//    init(content: String, deadline: Date, color : UIColor) {
//        self.content = content
//        self.deadline = deadline
//        self.color1 = color
//    }
//
//    enum CodingKeys: String, CodingKey {
//        case content
//        case deadline
//        case color1
//
//    }
//
//   init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        content = try container.decode(String.self, forKey: .content)
//        deadline = try container.decode(Date.self, forKey: .deadline)
//        color1 = try container.decode(Colors.self, forKey: .color1).uiColor1
//    }
//
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(content, forKey: .content)
//        try container.encode(deadline, forKey: .deadline)
//        try container.encode(Colors(uiColor: color1), forKey: .color1)
//    }
//}

//extension UIColor {
//    var color: Color {
//        return Color(self)
//    }
//}




