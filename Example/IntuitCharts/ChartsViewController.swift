//
//  ChartsViewController.swift
//  IntuitCharts_Example
//
//  Created by Surya Vineeth on 06/02/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit
import IntuitCharts

class ChartsViewController: UIViewController {
    
    var chartsViewModel:ChartsViewModel
    
    @IBOutlet weak var pieChartContainerView: UIView!
    
    @IBOutlet weak var barChartContainerView: UIView!
    
    private var scoreView:ScoreAnalysisViewController?
    
    private var rangeListView:RangeListViewController?
    
    
    init?(coder:NSCoder,chartsVM:ChartsViewModel) {
        self.chartsViewModel = chartsVM
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.bindVMToView()
        
        self.loadData()
    }

    
    func bindVMToView(){
        chartsViewModel.rangeList.bind { (rangeList) in
            DispatchQueue.main.async {
                self.updateUI()
            }
        }
        
        chartsViewModel.userScore.bind {_ in
            DispatchQueue.main.async {
                self.updateUI()
            }
        }
    }
    
    func updateUI(){
        self.prepareAndUpdateRangeListView()
        self.prepareAndUpdateScroreView()
    }
    
    func loadData() {
        chartsViewModel.loadRangeData()
        chartsViewModel.loadUserScore()
    }
    
    func prepareAndUpdateRangeListView(){
        let rangeListVM = self.chartsViewModel.getRangeListViewModel()
        if self.rangeListView == nil {
            //self.rangeListView = RangeListView.rangeListView(with: rangeListVM, parentView: barChartContainerView, delegate: self)
            self.rangeListView = RangeListViewController.rangeListView(with: rangeListVM, parentController: self, delegate: self)
        }else{
            self.rangeListView?.refreshData(listViewModel: rangeListVM)
        }
    }
    
    func prepareAndUpdateScroreView() {
        let scoreVM = self.chartsViewModel.getScoreViewModel()
        if self.scoreView == nil {
            //self.scoreView = ScoreAnalysisView.scoreView(with: scoreVM, parentView: pieChartContainerView, delegate: self)
            self.scoreView = ScoreAnalysisViewController.scoreView(with: scoreVM, parentController: self, delegate: self)
        }else{
            self.scoreView?.refreshData(scoreViewModel: scoreVM)
        }
    }
    
    func displayAlert (){
        let alert = UIAlertController(title: "Demo", message: "This is a demo app", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

}

extension ChartsViewController : RangeListViewProtocol {
    func rangeContainerView() -> UIView {
        return barChartContainerView
    }
    
    func didSelectInfo() {
        print("did select info")
        self.displayAlert()
    }
    
    
}

extension ChartsViewController: ScoreAnalysisViewProtocol{
    func scoreContainerView() -> UIView {
        return pieChartContainerView
    }
    
    func didSelectScoreAnalysis() {
        print("did select score anaysis")
        self.displayAlert()
    }
    
    
}
