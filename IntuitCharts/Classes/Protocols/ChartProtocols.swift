//
//  Protocols.swift
//  IntuitCharts
//
//  Created by Surya Vineeth on 08/02/21.
//

import Foundation

/// Delegate methods to be handled by the client applications using this library
public protocol RangeListViewProtocol:class {
    func didSelectInfo()
    func rangeContainerView()->UIView
}

/// Delegate methods to be handled by the client applications using this library
public protocol ScoreAnalysisViewProtocol:class {
    func didSelectScoreAnalysis()
    func scoreContainerView()->UIView
}
