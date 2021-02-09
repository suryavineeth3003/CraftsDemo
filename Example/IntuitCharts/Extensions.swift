//
//  Extensions.swift
//  IntuitCharts_Example
//
//  Created by Surya Vineeth on 06/02/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import IntuitCharts


extension URLSession:RequestSession{}

extension PieChartConfig {
    
    static func configFrom (score:UserScore)->PieChartConfig {
        var pieChartConfig = PieChartConfig(with:Float(score.score),min:Float(score.min),max:Float(score.max))
        pieChartConfig.backgroundArcStrokeColor = UIColor(hex: "#F4F4F4")!
        pieChartConfig.dateFormat = "dd/MM/yyyy"
        let strokeColor = UIColor.colorForValue(value:score.score)
        pieChartConfig.centerTextColor = strokeColor
        pieChartConfig.strokeColor = strokeColor
                pieChartConfig.arcWidth = 10
        pieChartConfig.animationDuration = 2
        
        return pieChartConfig
    }
//    static func customConfig(currentValue:Int, min:Int, max:Int)->PieChartConfig {
//
////        public var dateFormat:String = "dd/MM/yyyy"
////        public var backgroundArcStrokeColor:UIColor = .lightGray
////        public var strokeColor:UIColor = .black
////        public var centerTextColor:UIColor = .black
////        public var minMaxLabelTextColor:UIColor = .black
////        public var arcWidth:CGFloat = 15
////        public var animationDuration :CGFloat = 2
////        public var centerText:String = ""
////        public var minText:String = ""
////        public var maxText:String = ""
//
//
//        var piechartConfig = PieChartConfig()
//        piechartConfig.backgroundArcStrokeColor = UIColor(hex: "#F4F4F4")!
//        piechartConfig.centerTextColor = UIColor(hex: "#E1B94D")!
//        piechartConfig.strokeColor = UIColor(hex: "#E1B94D")!
//        piechartConfig.arcWidth = 10
//        piechartConfig.animationDuration = 2
//
//        return piechartConfig
//    }
}

