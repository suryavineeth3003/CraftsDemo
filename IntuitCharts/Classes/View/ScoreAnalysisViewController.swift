//
//  ScoreAnalysisViewController.swift
//  IntuitCharts
//
//  Created by Surya Vineeth on 08/02/21.
//

import UIKit

public class ScoreAnalysisViewController: UIViewController {

    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var piechartView: PieChartView!
    
    weak var delegate:ScoreAnalysisViewProtocol?
    var scoreViewModel:ScoreViewModel!
    
    
    public override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.piechartView.pieChartConfig = scoreViewModel.piechartConfig
        self.dateLbl.text = scoreViewModel.date
    }
    
    
    /// Creates the ScoreAnalysis view and adds to the parent view
    /// - Parameters:
    ///   - listViewModel: viewmodel
    ///   - parentView: parent view on which the range list view is to be added
    ///   - delegate: delegate to handle
    /// - Returns: constructed instance of ScoreANalysis View
    public class func scoreView(with scoreViewModel:ScoreViewModel, parentController:UIViewController,delegate:ScoreAnalysisViewProtocol)->ScoreAnalysisViewController {
         let parentView = delegate.scoreContainerView()
         let storyBoard = UIStoryboard(name: "Charts", bundle: Bundle.currentBundle())
        let scoreAnalysisVC = storyBoard.instantiateViewController(identifier: "ScoreAnalysisView") as! ScoreAnalysisViewController
        scoreAnalysisVC.scoreViewModel = scoreViewModel
        
        scoreAnalysisVC.delegate = delegate
        parentView.addSubview(scoreAnalysisVC.view)
        scoreAnalysisVC.view.translatesAutoresizingMaskIntoConstraints = false
        
        let top = NSLayoutConstraint(item: scoreAnalysisVC.view, attribute: .top, relatedBy: .equal, toItem: parentView, attribute: .top, multiplier: 1, constant: 0)
        let bottom = NSLayoutConstraint(item: parentView, attribute: .bottom, relatedBy: .equal, toItem: scoreAnalysisVC.view, attribute: .bottom, multiplier: 1, constant: 0)
        let left = NSLayoutConstraint(item: scoreAnalysisVC.view, attribute: .left, relatedBy: .equal, toItem: parentView, attribute: .left, multiplier: 1, constant: 0)
        let right = NSLayoutConstraint(item: parentView, attribute: .right, relatedBy: .equal, toItem: scoreAnalysisVC.view, attribute: .right, multiplier: 1, constant: 0)
        parentView.addConstraints([top,left,bottom,right])
        parentView.layoutIfNeeded()
      
        return scoreAnalysisVC
    }
    
    
    /// updates the viewModel and redraw's the chart
    /// - Parameter scoreViewModel: viewmodel
    public func refreshData(scoreViewModel:ScoreViewModel){
        self.scoreViewModel = scoreViewModel
        // reload chart
        piechartView.setNeedsDisplay()
    }
    
    
    /// Called on score analysis click
    /// - Parameter sender: self
    @IBAction func clickedScoreAnalysis(_ sender: Any) {
        self.delegate?.didSelectScoreAnalysis()
    }
   
}
