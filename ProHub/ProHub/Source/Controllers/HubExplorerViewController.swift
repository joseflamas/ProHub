//
//  HubViewController.swift
//  ProHub
//
//  Created by Guillermo Irigoyen on 11/21/18.
//  Copyright © 2018 Guillermo Irigoyen. All rights reserved.
//

import Foundation
import UIKit


/// Hub Explorer View
//
//  Main View of the application, contains a map with all interesting points
//  withe resumed data and way to add, edit or remove Cities, Flocks and Schedules Listings and details
final class HubExplorerViewController : UIViewController {
    
    // Initializers
    // - comment: This implementation uses Nib files so no need to override view controller init
    //            unless there is a reason
    
    // Controller overrides
    override func viewDidLoad() {
        
        /// Pull Requests
        REQUESTMANAGER.simpleRequestTo(to: "https://api.github.com/repos/magicalpanda/MagicalRecord/pulls?state=open")
        //https://api.github.com/repos/magicalpanda/MagicalRecord/pulls
        
        /// Pull Request Diff
        REQUESTMANAGER.simpleRequestTo(to: "https://patch-diff.githubusercontent.com/raw/magicalpanda/MagicalRecord/pull/1119.diff", withResponseFormat: .raw)
        //https://patch-diff.githubusercontent.com/raw/magicalpanda/MagicalRecord/pull/1119.diff

    }
    
    
}
