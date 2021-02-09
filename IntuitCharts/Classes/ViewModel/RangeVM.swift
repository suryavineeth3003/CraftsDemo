//
//  RangeVM.swift
//  IntuitCharts_Example
//
//  Created by Surya Vineeth on 06/02/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation
import UIKit


/// ViewModel of the RangeListView
public struct RangeVM {
    private var range:Range
    
   public init(with range:Range) {
        self.range = range
    }
    
    var percentage:String {
        return "\(self.range.percentage)%"
    }
    
    var formattedRange:String {
        return "\(self.range.min) - \(self.range.max)"
    }
    
    public var minRange:Int{
        return self.range.min
    }
    
    public var maxRange:Int{
        return self.range.max
    }
    
    
    /// Determines if the provided value is withing the range
    /// - Parameter value: current user score value
    /// - Returns: true or false
    func containsValueInRange(value:Int)->Bool{
        let closedRange = self.range.min...self.range.max
        return closedRange.contains(value)
    }
    
    
}
