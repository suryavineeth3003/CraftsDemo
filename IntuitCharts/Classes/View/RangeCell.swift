//
//  RangeCell.swift
//  IntuitCharts_Example
//
//  Created by Surya Vineeth on 06/02/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit


public class RangeCell: UITableViewCell {

    @IBOutlet weak var pointerView: UIView!
    @IBOutlet weak var pointerLbl: UILabel!
    @IBOutlet weak var rangeLbl: UILabel!
    @IBOutlet weak var barView: UIView!
    @IBOutlet weak var percentageLbl: UILabel!
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.contentView.backgroundColor = UIColor.clear
        self.backgroundColor = UIColor.clear
        self.applyShadowToPointerView()
    }
    
    
    /// adds shadow behind pointerview
    func applyShadowToPointerView() {
        pointerView.layer.masksToBounds = false
        pointerView.layer.shadowColor = UIColor.black.cgColor
        pointerView.layer.shadowOpacity = 0.5
        pointerView.layer.shadowOffset = CGSize(width: 5, height: 5)
        pointerView.layer.shadowRadius = 5
    }

    
    /// updates the labels with range data
    /// - Parameter rangeVM: viewModel
    func applyRangeData(rangeVM:RangeVM){
        self.rangeLbl.text = rangeVM.formattedRange
        self.percentageLbl.text = rangeVM.percentage
        self.setBackgroundColor(rangeVM: rangeVM)
    }
    
    
    /// applies background color to the bar
    /// - Parameter rangeVM: viewmodel
    func setBackgroundColor(rangeVM:RangeVM){
        let barColor:UIColor = UIColor.color(for: rangeVM.minRange, maxRange: rangeVM.maxRange)
        self.barView.backgroundColor = barColor
    }
    
    
    /// Displays pointerView
    /// - Parameter pointerValue: pointerValue
    func displayPointer(pointerValue:String){
        self.pointerView.isHidden = false
        self.pointerLbl.text = pointerValue
    }
    
    
    /// Hides the pointerview
    func hidePointer(){
        self.pointerView.isHidden = true
    }
}
