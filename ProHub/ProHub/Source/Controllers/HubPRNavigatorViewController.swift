//
//  HubPRNavigatorViewController.swift
//  ProHub
//
//  Created by Guillermo Irigoyen on 11/24/18.
//  Copyright © 2018 Guillermo Irigoyen. All rights reserved.
//

import Foundation
import UIKit


final class HubPRNavigatorViewController : UIViewController {
    
    @IBOutlet weak var optionView: UIView!
    @IBOutlet weak var ownerInput: UITextField!
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var lookButton: UIButton!
    @IBOutlet weak var pullsTable: UITableView!
    @IBOutlet weak var hideShowButton: UIButton!
    
    
    var prList : [PullRequest] = [PullRequest]()
    
    // Initializers
    // - comment: This implementation uses Nib files so no need to override view controller init
    //            unless there is a reason
    
    // Controller overrides
    override func viewDidLoad() {
       setDefaultState()

    }
    
    private func setDefaultState(){
         view.backgroundColor = .lightGray
         ownerInput.text = DEFAULT_REPOSITORY_OWNER
         nameInput.text  = DEFAULT_REPOSITORY_NAME
        
         prList = DATAMANAGER.pullRequests
         DATAMANAGER.listsDelegate = self
        
         pullsTable.delegate   = self
         pullsTable.dataSource = self
         pullsTable.reloadData()
        
    }
    
}

extension HubPRNavigatorViewController {
    
    @IBAction
    func lookForRepository(_ sender: Any){
        let owner = ownerInput.text ?? DEFAULT_REPOSITORY_OWNER
        let name  = nameInput.text ?? DEFAULT_REPOSITORY_NAME
        
        DATAMANAGER.getPullRequestFromRepository(owner: owner,repo: name)
        
        DEFAULT_REPOSITORY_OWNER = owner
        DEFAULT_REPOSITORY_NAME  = name

    }
    
    @IBAction
    func hideShowOptionsView(_ sender: Any){
        if hideShowButton.titleLabel?.text == "LESS"{
            hideOptionView()
        } else {
            showOptionView()
        }
        
    }
    
}

extension HubPRNavigatorViewController : DataManagerPRListDataDelegate {
    func PRListInformationObtained(list: [PullRequest]) {
        DispatchQueue.main.async {
            print("New Data For Table")
            self.prList = list
            self.pullsTable.reloadData()
        }
    }
}

extension HubPRNavigatorViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return prList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "DEFAULT_CELL")
        let pr = prList[indexPath.item]
        
        cell.textLabel?.text = pr.pullRequestTitle.uppercased()
        cell.detailTextLabel?.text = String(pr.pullRequestNumber).uppercased()
        cell.detailTextLabel?.textColor = .lightGray
        
        return cell
    }
    
    
}

extension HubPRNavigatorViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        VIEWCOORDINATOR.updateNavigationControllerTitle(to: prList[indexPath.item].pullRequestTitle.uppercased())
        // Get First Diff
        DATAMANAGER.getPullRequestDiff(owner: DEFAULT_REPOSITORY_OWNER,
                                       repo: DEFAULT_REPOSITORY_NAME,
                                       number: String(prList[indexPath.item].pullRequestNumber))
    }
    
}


extension HubPRNavigatorViewController {
    // Animations
    func hideOptionView(){
        UIView.animate(withDuration: 0.5, animations: {
            self.view.frame.origin.x = self.view.frame.origin.x - 240
            self.hideShowButton.setTitle("MORE", for: .normal)
        }, completion: nil)
    }
    
    func showOptionView(){
        UIView.animate(withDuration: 0.5, animations: {
            self.view.frame.origin.x = self.view.frame.origin.x + 240
            self.hideShowButton.setTitle("LESS", for: .normal)
        }, completion: nil)
    }
    
}
