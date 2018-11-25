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
    
    
    @IBOutlet var navigatorController  : HubPRNavigatorViewController?
    @IBOutlet var comparisonController : HubPRComparisonViewViewController?
    
    
    // Initializers
    // - comment: This implementation uses Nib files so no need to override view controller init
    //            unless there is a reason
    
    // Controller overrides
    override func viewDidLoad() {
        view.backgroundColor = .lightGray
        loadViewComponents()
        DATAMANAGER.getInitialData()
        
    }
    
    
    private func loadViewComponents(){
        DispatchQueue.main.async {
            
            self.comparisonController = HubPRComparisonViewViewController(nibName: "HubPRComparisonViewViewController",
                                                                     bundle: .main)
            self.comparisonController?.view.frame = self.view.frame
            
            self.navigatorController = HubPRNavigatorViewController(nibName: "HubPRNavigatorViewController",
                                                               bundle: .main)
            self.navigatorController?.view.frame = CGRect(x: 0, y: (self.view.frame.height/2 - 160),
                                                          width: 320, height: 320)
            self.navigatorController?.view.backgroundColor = .clear
            
            
            self.comparisonController?.willMove(toParent: self)
            self.navigatorController?.willMove(toParent: self)
            
            self.addChild(self.comparisonController!)
            self.addChild(self.navigatorController!)
            self.view.addSubview(self.comparisonController!.view)
            self.view.addSubview(self.navigatorController!.view)
            
            self.comparisonController?.didMove(toParent: self)
            self.navigatorController?.didMove(toParent: self)
            
        }
    }
    
}





