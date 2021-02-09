//
//  RangeTableDataSource.swift
//  IntuitCharts
//
//  Created by Surya Vineeth on 08/02/21.
//

import Foundation
import UIKit


/// Datasource to load the table View
class RangeTableDataSource:NSObject,UITableViewDataSource {
    var viewModel:RangeListViewModel
    init(with viewModel:RangeListViewModel) {
        self.viewModel = viewModel
    }
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.rangeVM.value.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "rangeCell") as? RangeCell else{
            return UITableViewCell()
        }
        
        let rangeVM = self.viewModel.rangeVM.value[indexPath.row]
        cell.applyRangeData(rangeVM: rangeVM)
        
        if self.viewModel.shouldShowPointer(forRow: indexPath.row){
            cell.displayPointer(pointerValue: self.viewModel.displayablePointerValue)
        }else{
            cell.hidePointer()
        }
        
        return cell
    }
}
