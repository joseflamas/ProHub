//
//  Extensions.swift
//  ProHub
//
//  Created by Guillermo Irigoyen on 11/21/18.
//  Copyright © 2018 Guillermo Irigoyen. All rights reserved.
//

import Foundation
import UIKit

// MARK: - UIViews
extension UIView {
    
    /// Loads a view with a nibname string
    ///
    /// - Parameter nibName: name of the nib file
    /// - Returns: a view
    public func loadViewFromNib(nibName:String) -> UIView?{
        let nibView = Bundle.main.loadNibNamed(nibName, owner: nil, options:nil )![0] as! UIView
        return nibView
    }
    
}

// MARK: - UIViewController
extension UIViewController {
    
    /// Loads a view controller with a nibname string
    ///
    /// - Parameter nibName: name of the nib file
    /// - Returns: a view
    public func loadViewControllerFromNib(nibName:String) -> UIViewController?{
        let nibView = Bundle.main.loadNibNamed(nibName, owner: nil, options:nil )![0] as! UIViewController
        return nibView
    }
    
}
