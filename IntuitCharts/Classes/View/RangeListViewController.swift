//
//  RangeListViewController.swift
//  IntuitCharts
//
//  Created by Surya Vineeth on 08/02/21.
//

import UIKit

public class RangeListViewController: UIViewController {

    @IBOutlet weak var rangeTableView: UITableView!
    
    weak var delegate:RangeListViewProtocol?
    
    private var rangeTableDataSource : RangeTableDataSource?
    
    public override func viewDidLoad() {
        super.viewDidLoad()

        self.registerCell()
        // Do any additional setup after loading the view.
        self.rangeTableView.dataSource = rangeTableDataSource
        self.rangeTableView.backgroundColor = UIColor.clear
        self.rangeTableView.reloadData()

    }
    
    public func refreshData(listViewModel:RangeListViewModel){
        self.rangeTableDataSource?.viewModel = listViewModel
        // reload table
        self.rangeTableView.reloadData()
    }
    
    
    /// Creates the RangeList view and adds to the parent view
    /// - Parameters:
    ///   - listViewModel: viewmodel
    ///   - parentView: parent view on which the range list view is to be added
    ///   - delegate: delegate to handle
    /// - Returns: constructed instance of RangeListView
    public class func rangeListView(with listViewModel:RangeListViewModel, parentController:UIViewController,delegate:RangeListViewProtocol)->RangeListViewController {
        let parentView = delegate.rangeContainerView()
        let storyBoard = UIStoryboard(name: "Charts", bundle: Bundle.currentBundle())
        let rangeVC = storyBoard.instantiateViewController(identifier: "RangeListView") as! RangeListViewController
        rangeVC.delegate = delegate
        let tableDataSource = RangeTableDataSource(with: listViewModel)
        rangeVC.rangeTableDataSource = tableDataSource
        rangeVC.view.translatesAutoresizingMaskIntoConstraints = false
        parentView.addSubview(rangeVC.view)
        parentController.addChildViewController(rangeVC)
        rangeVC.didMove(toParentViewController: parentController)

        
        rangeVC.view.topAnchor.constraint(equalTo: parentView.topAnchor, constant: 0).isActive = true
        rangeVC.view.leadingAnchor.constraint(equalTo: parentView.leadingAnchor, constant: 0).isActive = true
        parentView.trailingAnchor.constraint(equalTo: rangeVC.view.trailingAnchor, constant: 0).isActive = true
        parentView.bottomAnchor.constraint(equalTo: rangeVC.view.bottomAnchor, constant: 0).isActive = true
        return rangeVC
    }
    
    
    
    /// Loads and registers cell from nib
    func registerCell(){
        self.rangeTableView.register(UINib(nibName: "RangeCell", bundle: Bundle.currentBundle()), forCellReuseIdentifier: "rangeCell")
    }
    

    /// Called on click of Info button
    /// - Parameter sender: self
    @IBAction func clickedInfo(_ sender: Any) {
        self.delegate?.didSelectInfo()
    }
}
