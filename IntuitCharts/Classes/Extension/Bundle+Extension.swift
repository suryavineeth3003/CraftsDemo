//
//  Bundle+Extension.swift
//  IntuitCharts
//
//  Created by Surya Vineeth on 08/02/21.
//

import Foundation

extension Bundle {
    
    /// Returns the current bundle path
    /// - Returns: bundle created from the bundle id
    class func currentBundle()->Bundle{
        guard let resourceBundle = Bundle(identifier: "org.cocoapods.IntuitCharts")else{
            return Bundle.main
        }
        return resourceBundle
    }
   
}
