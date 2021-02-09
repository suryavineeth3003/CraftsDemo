//
//  PieChartViewController.swift
//  Pods
//
//  Created by Surya Vineeth on 06/02/21.
//

import UIKit


/// Creates the pie chart
public class PieChartView: UIView {
    
    public static let arcLayerName = "arcLayer"
    public static let textLayerName = "textLayer"
    
    
    var pieChartConfig:PieChartConfig=PieChartConfig(with: 0, min: 0, max: 0){
        didSet{
            self.drawContents()
        }
    }
    
    public override func draw(_ rect: CGRect) {
        self.drawContents()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.drawContents()
    }
    
    
    /// draws the required contents for the pie chart
    func drawContents(){
       
        self.removeLayer()
        let center = CGPoint(x: self.width / 2, y: self.height/2)
        
        self.drawBackgroundArc(center: center)
        
        self.drawOuterArc(center: center)

        self.drawInnerCircle(center: center)

        self.drawCenterText(center: center)

        self.drawMinValue(center: center)

        self.drawMaxValue(center: center)
        
    }
    
    
    /// Draws the max value text
    /// - Parameters:
    ///   - center: center of the piechart view
    func drawMaxValue(center:CGPoint){
        let maxValueTextLayer = CATextLayer()
        maxValueTextLayer.frame = CGRect(x: self.width-(self.pieChartConfig.arcWidth/2 + 25), y: self.height/2 + 10, width: 50, height: 20)
        maxValueTextLayer.foregroundColor = self.pieChartConfig.minMaxLabelTextColor.cgColor
        let attribs1 = [NSAttributedStringKey.font:UIFont.systemFont(ofSize: 9),
                       NSAttributedStringKey.foregroundColor:UIColor.black,
                        ]
        let attributedString1 = NSAttributedString(string: "\(self.pieChartConfig.maxValue)" , attributes: attribs1)
        maxValueTextLayer.string = attributedString1
        maxValueTextLayer.alignmentMode = kCAAlignmentCenter
        maxValueTextLayer.name = PieChartView.textLayerName
        self.layer.addSublayer(maxValueTextLayer)
    }
    
    /// Draws the min value text
    /// - Parameters:
    ///   - center: center of the piechart view
    func drawMinValue(center:CGPoint){
        let minValueTextLayer = CATextLayer()
        minValueTextLayer.frame = CGRect(x: self.width/2, y: self.height-(self.pieChartConfig.arcWidth/2), width: 50, height: 20)
        minValueTextLayer.foregroundColor = self.pieChartConfig.minMaxLabelTextColor.cgColor
        let attribs = [NSAttributedStringKey.font:UIFont.systemFont(ofSize: 9),
                       NSAttributedStringKey.foregroundColor:UIColor.black,
        ]
        let attributedString = NSAttributedString(string: "\(self.pieChartConfig.maxValue)" , attributes: attribs)
        minValueTextLayer.string = attributedString
        minValueTextLayer.alignmentMode = kCAAlignmentCenter
        minValueTextLayer.name = PieChartView.textLayerName
        self.layer.addSublayer(minValueTextLayer)
        
    }
    
    /// Draws the background arc
    /// - Parameters:
    ///   - center: center of the piechart view
    func drawBackgroundArc(center:CGPoint){
        let backgroundArchPath = UIBezierPath()
        backgroundArchPath.move(to: center)
        backgroundArchPath.addArc(withCenter: center,
                          radius: self.width / 2,
                          startAngle: .pi/2,
                          endAngle:  2 * .pi,
                          clockwise: true)
        backgroundArchPath.close()
        
        let backroundArc:CAShapeLayer = CAShapeLayer()
        backroundArc.path = backgroundArchPath.cgPath
        backroundArc.fillColor = UIColor.clear.cgColor
        backroundArc.strokeColor = self.pieChartConfig.backgroundArcStrokeColor.cgColor
        backroundArc.lineWidth = self.pieChartConfig.arcWidth
        backroundArc.name = PieChartView.arcLayerName
        self.layer.addSublayer(backroundArc)
        
    }
    
    /// Draws the outer arc
    /// - Parameters:
    ///   - center: center of the piechart view
    func drawOuterArc(center:CGPoint){
        if self.pieChartConfig.value < self.pieChartConfig.minValue {return}
       
            let outerArchPath = UIBezierPath()
            outerArchPath.move(to: center)
            outerArchPath.addArc(withCenter: center,
                                      radius: self.width / 2,
                                      startAngle: .pi/2,
                                      endAngle:  self.pieChartConfig.calculatedAngle,
                                      clockwise: true)
            outerArchPath.close()
            
            let outerArc:CAShapeLayer = CAShapeLayer()
            outerArc.path = outerArchPath.cgPath
            outerArc.fillColor = UIColor.clear.cgColor
            //outerArc.strokeColor = UIColor.colorForValue(value:Int(self.pieChartConfig.value) ?? 0).cgColor
            outerArc.strokeColor = self.pieChartConfig.strokeColor.cgColor
            outerArc.strokeEnd = 0.0 // dont draw the arch initially
            outerArc.lineWidth = self.pieChartConfig.arcWidth
            outerArc.name = PieChartView.arcLayerName
            self.layer.addSublayer(outerArc)
            
            // add animation
            let animation = CABasicAnimation(keyPath: "strokeEnd")
            animation.duration = CFTimeInterval(self.pieChartConfig.animationDuration)
            animation.fromValue = 0
            animation.toValue = 1
            animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
            
            outerArc.strokeEnd = 1.0
            outerArc.add(animation, forKey: "animateArc")
        
    }
    
    /// Draws the inner cirle
    /// - Parameters:
    ///   - center: center of the piechart view
    func drawInnerCircle(center:CGPoint){
        let innerCircleRadius = (self.width-self.pieChartConfig.arcWidth)/2
        
        let circularPath = UIBezierPath()
        circularPath.move(to: center)
        circularPath.addArc(withCenter: center, radius:innerCircleRadius , startAngle: 0, endAngle: 2 * .pi, clockwise: true)
        
        let innerCircle:CAShapeLayer = CAShapeLayer()
        innerCircle.path = circularPath.cgPath
        innerCircle.fillColor = UIColor.white.cgColor
        innerCircle.name = PieChartView.arcLayerName
        self.layer.addSublayer(innerCircle)
        
    }
    
    /// Draws the center value
    /// - Parameters:
    ///   - center: center of the piechart view
    func drawCenterText(center:CGPoint){
        // draw center text
        
        let textLayer = CATextLayer()
        textLayer.frame = CGRect(x: 0, y: self.height/2, width: self.width, height: 50)
        textLayer.foregroundColor = self.pieChartConfig.centerTextColor.cgColor
        
        let attribs = [NSAttributedStringKey.font:UIFont.boldSystemFont(ofSize: 40),
                       NSAttributedStringKey.foregroundColor:self.pieChartConfig.strokeColor]
        let attributedString = NSAttributedString(string: "\(self.pieChartConfig.value)" , attributes: attribs)
        textLayer.string = attributedString
        textLayer.alignmentMode = kCAAlignmentCenter
        textLayer.name = PieChartView.textLayerName
        textLayer.position = center
        self.layer.addSublayer(textLayer)
    }
    
    
    /// Removes already added layers of text and shapes
    /// - Parameters:
    ///   - center: center of the piechart view
    ///   - scoreVM: view model
    func removeLayer (){
        self.layer.sublayers?.forEach {
            if ($0.name == PieChartView.arcLayerName || $0.name == PieChartView.textLayerName) {
                $0.removeFromSuperlayer()
            }
        }
    }
    
}

