//
//  UIColor+Extensions.swift
//  IntuitCharts_Example
//
//  Created by Surya Vineeth on 07/02/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
public extension UIColor {
       convenience init?(hex: String) {
         var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
         hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

         var rgb: UInt32 = 0

         var r: CGFloat = 0.0
         var g: CGFloat = 0.0
         var b: CGFloat = 0.0
         var a: CGFloat = 1.0

         let length = hexSanitized.characters.count

         guard Scanner(string: hexSanitized).scanHexInt32(&rgb) else { return nil }

         if length == 6 {
             r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
             g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
             b = CGFloat(rgb & 0x0000FF) / 255.0

         } else if length == 8 {
             r = CGFloat((rgb & 0xFF000000) >> 24) / 255.0
             g = CGFloat((rgb & 0x00FF0000) >> 16) / 255.0
             b = CGFloat((rgb & 0x0000FF00) >> 8) / 255.0
             a = CGFloat(rgb & 0x000000FF) / 255.0

         } else {
             return nil
         }

         self.init(red: r, green: g, blue: b, alpha: a)
     }
    
    static var rangeOne:UIColor {
        return UIColor(hex: "#B1CE70")!
    }
    
    static var rangeTwo:UIColor {
        return UIColor(hex: "#E1B94D")!
    }
    
    static var rangeThree:UIColor {
        return UIColor(hex: "#D98A42")!
    }
    
    static var rangeFour:UIColor {
        return UIColor(hex: "#D26035")!
    }
    
    static var rangeFive:UIColor {
        return UIColor(hex: "#CF4C33")!
    }
    
    
    /// Determines the applicable comor for a given range
    /// - Parameters:
    ///   - minRange: minimum value in the range
    ///   - maxRange: maximum value in the range
    /// - Returns: color based on the range provided
    class func color(for minRange:Int,maxRange:Int) -> UIColor {
        switch minRange...maxRange {
            case RangeSlab.one:
                return UIColor.rangeOne
            case RangeSlab.two:
                return UIColor.rangeTwo
            case RangeSlab.three:
                return UIColor.rangeThree
            case RangeSlab.four:
                return UIColor.rangeFour
            case RangeSlab.five:
                return UIColor.rangeFive
            default:
                return UIColor.gray
        
        }
    }
    
    class func colorForValue(value:Int)->UIColor {
        switch value {
          case RangeSlab.one:
              return UIColor.rangeOne
          case RangeSlab.two:
              return UIColor.rangeTwo
          case RangeSlab.three:
              return UIColor.rangeThree
          case RangeSlab.four:
              return UIColor.rangeFour
          case RangeSlab.five:
              return UIColor.rangeFive
          default:
              return UIColor.gray
    }
 }
}
