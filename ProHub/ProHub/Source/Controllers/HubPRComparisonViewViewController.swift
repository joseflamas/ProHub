//
//  HubPRComparisonViewViewController.swift
//  ProHub
//
//  Created by Guillermo Irigoyen on 11/24/18.
//  Copyright © 2018 Guillermo Irigoyen. All rights reserved.
//

import Foundation
import UIKit


final class HubPRComparisonViewViewController : UIViewController {
    
    
    // Initializers
    // - comment: This implementation uses Nib files so no need to override view controller init
    //            unless there is a reason
    
    // Controller overrides
    override func viewDidLoad() {
        view.backgroundColor = .lightGray
        // Dismiss keyboard
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        self.view.addGestureRecognizer(tap)
    }
    
    // Dismiss keyboard
    @objc
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
}


extension HubPRComparisonViewViewController : DataManagerPRDiffInformationDelegate {
    func PRDiffObtained(diff: PullRequestDiff) {
        
    }
    
}
