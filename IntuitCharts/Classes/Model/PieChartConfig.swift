//
//  PieChart.swift
//  IntuitCharts
//
//  Created by Surya Vineeth on 06/02/21.
//

import Foundation
import UIKit


/// Provides configurations to configure the pieChart
public struct PieChartConfig {
    public var dateFormat:String = "dd/MM/yyyy"
    public var backgroundArcStrokeColor:UIColor = .lightGray
    public var strokeColor:UIColor = .black
    public var centerTextColor:UIColor = .black
    public var minMaxLabelTextColor:UIColor = .black
    public var arcWidth:CGFloat = 15
    public var animationDuration :CGFloat = 2
    var value:Float
    var minValue:Float
    var maxValue:Float
    
    public init(with value:Float, min:Float, max:Float) {
        self.value = value
        self.minValue = min
        self.maxValue = max
    }
    
    
     /// Determines the duration of animation for the current user score
     var calculatedDuration:CGFloat {
        let current:CGFloat = CGFloat(self.value)
        let min:CGFloat = CGFloat(self.minValue)
        let max:CGFloat = CGFloat(self.maxValue)

         let difference = abs(max - min)
         let totalDuration = self.animationDuration
         
         let calculatedDuration = ((current-min) * totalDuration)/difference
         return calculatedDuration
     }
     
     
     /// Determines the current angle based on user's current score
     var calculatedAngle:CGFloat {
         let current:CGFloat = CGFloat(self.value)
         let min:CGFloat = CGFloat(self.minValue)
         let max:CGFloat = CGFloat(self.maxValue)

         let difference = (current - min)
         let percentage  = (difference * 100) / (max - min)
         let angle = ((percentage/100) * ((3/2) * .pi)) + (.pi / 2)
         
         if angle < .pi/2 {
             return .pi/2
         }else if angle > 2 * .pi {
             return 2 * .pi
         }else{
             return angle
         }
     }
}
