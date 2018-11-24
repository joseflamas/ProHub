//
//  DataManager.swift
//  ProHub
//
//  Created by Guillermo Irigoyen on 11/21/18.
//  Copyright © 2018 Guillermo Irigoyen. All rights reserved.
//

import Foundation

/// Data Manager
/// - comment:   Centralized place to handle persistent an ephimeral data
///              Initialized by the Application Manager
final class DataManager {
    
    private(set) var pullRequests    : [PullRequest] = [PullRequest]()
    private(set) var pullRequestDiff : PullRequestDiff?
    
    /// Initializers
    init(){
        print("Initializing Data Manager ...")
        
    }
    
}

extension DataManager {
    
    /// JSON
    func getInitialData() {
        /// Pull Requests
        REQUESTMANAGER.delegate = self
        getPullRequestFromRepository()
        
    }
    
    func getPullRequestFromRepository(owner: String = "magicalpanda", repo: String = "MagicalRecord", state: String = "open" ){
        pullRequests.removeAll()
        /// Pull Requests
        /// https://api.github.com/repos/magicalpanda/MagicalRecord/pulls
        let prURL = "https://api.github.com/repos/\(owner)/\(repo)/pulls?state=\(state)"
        
        VIEWCOORDINATOR.presentActivityIndicator(message: "REQUESTING PULL REQUESTS")
        REQUESTMANAGER.simpleRequestTo(to:prURL)
        
    }
    
    func getPullRequestDiff(owner: String, repo: String, number: String){
        /// Pull Request Diff
        /// https://patch-diff.githubusercontent.com/raw/magicalpanda/MagicalRecord/pull/1119.diff
        let diffURL = "https://patch-diff.githubusercontent.com/raw/\(owner)/\(repo)/pulls/\(number).diff"
        
        VIEWCOORDINATOR.presentActivityIndicator(message: "REQUESTING DIFF")
        REQUESTMANAGER.simpleRequestTo(to: diffURL, forResponseFormat: .raw)
        
    }
    
}



extension DataManager : SimpleRequestManagerDelegate {
    
    func simpleRequestInProgress(type: ResponseFormatType, stage: RequestState){
        VIEWCOORDINATOR.updateActivityMessage(message: "Request stage: \(stage.string)")
    }
    
    func simpleRequestResponseObtained(response: HTTPURLResponse) {
    }
    
    func simpleRequestDataObtained(type: ResponseFormatType, data: Data) {
        
        switch type {
        case .json:
            jsonDataToObject(data: data)
            
        case .raw:
            rawDataToString(data: data)
        }
        
    }
    
}


extension DataManager {
    
    /// To get Pull Requests from repo
    func jsonDataToObject(data: Data){
        print("\n\nDATA MANAGER: Pull Requestes JSON Object\n\n")
        
        let jsonData = try! JSONSerialization.jsonObject(with: data, options: .allowFragments)
        // print("\(jsonData)\n\n")
        // TO-DO: Replace Struct with a Codable Object?
        
        let prArray : Array<Dictionary<String,AnyObject>> = jsonData as! Array<Dictionary<String,AnyObject>>
        
        for pr in prArray {

            let author = pr["user"] as! Dictionary<String,AnyObject>
            let head   = pr["head"] as! Dictionary<String,AnyObject>
            let base   = pr["base"] as! Dictionary<String,AnyObject>
            
            let pullRequest : PullRequest = PullRequest(pullId:      pr["id"]        as! Int,
                                                        pullNumber:  pr["number"]    as! Int,
                                                        pullTitle:   pr["title"]     as! String,
                                                        pullState:   pr["state"]     as! String,
                                                        idAuthor:    author["id"]    as! Int,
                                                        nameAuthor:  author["login"] as! String,
                                                        association: pr["author_association"] as! String,
                                                        labelHead:   head["label"]   as! String,
                                                        labelBase:   base["label"]   as! String
                                                        )
            pullRequests.append(pullRequest)
        }
        
        print("Number of pull requests: \(pullRequests.count)")
        print(pullRequests[0])
        print("\n")
        VIEWCOORDINATOR.removeActivityIndicator()
        
    }
    
    /// RAW
    /// To get Diff data
    func rawDataToString(data: Data){
        print("\n\nDATA MANAGER: Compound Pull Diff\n\n")
        
        let rawData = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
        print("\(rawData!)\n\n")
        
//        let diff = data
        VIEWCOORDINATOR.removeActivityIndicator()
    }
    
}
