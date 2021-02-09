//
//  PieChartVM.swift
//  IntuitCharts
//
//  Created by H352336 on 06/02/21.
//

import Foundation

struct PieChartVM {
    
    private var pieChart:PieChart
    
    init(pieChart:PieChart) {
        self.pieChart = pieChart
    }
    
    var value:String {
        return "\(self.pieChart.value)"
    }
    
    var minRangeValue:String {
        return "\(self.pieChart.min)"
    }
    
    var maxRangeValue:String {
        return "\(self.pieChart.max)"
    }
    
}
