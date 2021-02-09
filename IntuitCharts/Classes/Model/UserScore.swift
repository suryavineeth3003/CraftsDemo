//
//  UserScore.swift
//  IntuitCharts_Example
//
//  Created by Surya Vineeth on 06/02/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation


/// Model to define Usser score data
public struct UserScore{
    public let score:Int
    public let date:String
    public var min:Int = 0
    public var max:Int = 0
    
    public init(withScore score:Int, date:String){
        self.score = score
        self.date = date
    }
}
