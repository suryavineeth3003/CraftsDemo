//
//  PieChartViewController.swift
//  Pods
//
//  Created by H352336 on 06/02/21.
//

import UIKit

class PieChartView: UIView {

    private var pieChartVM:PieChartVM
    
    init(with pieChartVM:PieChartVM) {
        self.pieChartVM = pieChartVM
    }
    
    override func draw(_ rect: CGRect) {
        let center = CGPoint(x: fullSize.width / 2, y: fullSize.height)
        let beizerPath = UIBezierPath()
        beizerPath.move(to: center)
        beizerPath.addArc(withCenter: center,
                          radius: grayCircleSize.width / 2,
                          startAngle: .pi,
                          endAngle: 2 * .pi,
                          clockwise: true)
        beizerPath.close()
        let innerGrayCircle = CAShapeLayer()
        innerGrayCircle.path = beizerPath.cgPath
        innerGrayCircle.fillColor = UIColor.gray.cgColor
        return innerGrayCircle
    }
    
    
    
}
