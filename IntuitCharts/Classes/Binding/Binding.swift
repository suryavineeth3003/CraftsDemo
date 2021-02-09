//
//  Binding.swift
//  IntuitCharts_Example
//
//  Created by Surya Vineeth on 06/02/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation


/// This class helps to observe the changes to the value ans notify
public class Binding<T> {
    public typealias Listener = (T)->Void
    
    var listener:Listener?
    
    
    /// initializer
    /// - Parameter value: underlying value
    public init(with value:T) {
        self.value = value
    }
    
    public var value:T {
        didSet {
            self.listener?(self.value)
        }
    }
    
    
    /// bind the listener to receive updates on cny chages that happen in value
    /// - Parameter listener: listener
    public func bind(listener: @escaping Listener) {
        self.listener = listener
    }
    
}
