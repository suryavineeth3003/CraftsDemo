//
//  PieChartViewController.swift
//  IntuitCharts
//
//  Created by H352336 on 06/02/21.
//

import UIKit

class PieChartViewController: UIViewController {
    

    @IBOutlet weak var dateLbl: UILabel!
    
    private var pieChartVM:PieChartVM
    
    private var pieChartView:PieChartView
    
    class func pieChartViewController (with pieChartModel:PieChartVM)->PieChartViewController{
        let storyboard = UIStoryboard(name: "Charts", bundle: Bundle.main)
        let pieChartVC = storyboard.instantiateViewController(identifier: "piechartVC") as! PieChartViewController
        pieChartVC.pieChartVM = pieChartModel
        return pieChartVC
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func loadChart(){
        
    }

    @IBAction func clickedScoreAnalysis(_ sender: Any) {
        
    }
}
