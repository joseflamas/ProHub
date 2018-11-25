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
    
    @IBOutlet weak var comparisonTable: UITableView!
    
    var compoundedPRDiff : PullRequestDiff? {
        didSet{
            updateView()
        }
    }
    
    // Initializers
    // - comment: This implementation uses Nib files so no need to override view controller init
    //            unless there is a reason
    
    // Controller overrides
    override func viewDidLoad() {
        view.backgroundColor = .lightGray
        DATAMANAGER.diffDelegate = self
        
        comparisonTable.dataSource = self
        comparisonTable.register(UINib(nibName: "HubPRComparisonViewTableViewCell", bundle: .main),
                           forCellReuseIdentifier: "COMPARISON_CELL")
        // Dismiss keyboard
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        self.view.addGestureRecognizer(tap)
    }
    
    // Dismiss keyboard
    @objc
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    private func updateView(){
        print("Updating View")
    }
    
    
}


extension HubPRComparisonViewViewController : DataManagerPRDiffInformationDelegate {
    func PRDiffObtained(diff: PullRequestDiff) {
        compoundedPRDiff = diff
        
    }
}


extension HubPRComparisonViewViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "File"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "COMPARISON_CELL") as! HubPRComparisonViewTableViewCell
        return cell
    }
    
    
}
