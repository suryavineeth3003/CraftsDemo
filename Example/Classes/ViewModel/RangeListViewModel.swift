//
//  RangeListVM.swift
//  IntuitCharts_Example
//
//  Created by H352336 on 06/02/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation


struct RangeListViewModel {
    var rangeVM:Binding<[RangeVM]> = Binding(with: [])
    var currentValue:Binding<Int> = Binding(with: 0)
    
    init(with rangeList:[RangeVM], currentScore:Int){
        self.rangeVM.value = rangeList
        self.currentValue.value = currentScore
    }
    
    var displayablePointerValue:String {
        return "\(self.currentValue.value)"
    }

    func updateCurrentScore(score:Int) {
        self.currentValue.value = score
    }
    
    func shouldShowPointer(forRow row:Int)->Bool {
        let rangeVM = self.rangeVM.value[row]
        return rangeVM.containsValueInRange(value: self.currentValue.value)
    }
    
        
}
