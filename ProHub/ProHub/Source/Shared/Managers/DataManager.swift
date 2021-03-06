//
//  DataManager.swift
//  ProHub
//
//  Created by Guillermo Irigoyen on 11/21/18.
//  Copyright © 2018 Guillermo Irigoyen. All rights reserved.
//

import Foundation


// Lists
protocol DataManagerPRListDataDelegate {
    func PRListInformationObtained(list: [PullRequest] )

}

// Detail
protocol DataManagerPRDiffInformationDelegate {
    func PRDiffObtained(diff: PullRequestDiff)
    
}


/// Data Manager
/// - comment:   Centralized place to handle persistent an ephimeral data
///              Initialized by the Application Manager
final class DataManager {
    
    private(set) var pullRequests    : [PullRequest] = [PullRequest]()
    private(set) var pullRequestDiff : PullRequestDiff?
    
    var listsDelegate : DataManagerPRListDataDelegate?
    var diffDelegate  : DataManagerPRDiffInformationDelegate?
    
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
        getPullRequestFromRepository(owner: DEFAULT_REPOSITORY_OWNER, repo: DEFAULT_REPOSITORY_NAME)
        
    }
    
    func getPullRequestFromRepository(owner: String, repo: String, state: String = "open" ){
        pullRequests.removeAll()
        /// Pull Requests
        /// https://api.github.com/repos/magicalpanda/MagicalRecord/pulls
        let prURL = "https://api.github.com/repos/\(owner)/\(repo)/pulls?state=\(state)"
        
        VIEWCOORDINATOR.presentActivityIndicator(message: "REQUESTING PULL REQUESTS")
        REQUESTMANAGER.simpleRequestTo(to:prURL)
        
    }
    
    func getPullRequestDiff(owner: String, repo: String, number: String){
        /// Pull Request Diff
        /// https://patch-diff.githubusercontent.com/raw/magicalpanda/MagicalRecord/pull/1122.diff
        let diffURL = "https://patch-diff.githubusercontent.com/raw/\(owner)/\(repo)/pull/\(number).diff"
        
        VIEWCOORDINATOR.presentActivityIndicator(message: "REQUESTING DIFF")
        REQUESTMANAGER.simpleRequestTo(to: diffURL, forResponseFormat: .raw)
        
    }
    
}



extension DataManager : SimpleRequestManagerDelegate {
    
    func simpleRequestInProgress(type: ResponseFormatType, stage: RequestState){
        VIEWCOORDINATOR.updateActivityMessage(message: "Request stage: \(stage.string)")
    }
    
    func simpleRequestResponseObtained(response: HTTPURLResponse) {
        /// DEBUG HEADERS print("REQUEST MANAGER: \(response?.description ?? "REQUEST MANAGER: NO RESPONSE")")
    }
    
    func simpleRequestDataObtained(type: ResponseFormatType, data: Data) {
        switch type {
        case .json:
            jsonDataToObject(data: data)
            
        case .raw:
            rawDataToString(data: data)
        }
        
    }
    
    func simpleRequestDataNotFound(type: ResponseFormatType, message: String){
        VIEWCOORDINATOR.updateActivityMessage(message: message)
        VIEWCOORDINATOR.removeActivityIndicator()
        
    }
    
}


extension DataManager {
    
    /// To get Pull Requests from repo
    func jsonDataToObject(data: Data){
        print("\n\nDATA MANAGER: Pull Requests JSON Object\n\n")
        
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
        
        if pullRequests.count > 0 {
            print(pullRequests.first!)
            print("\n")
            VIEWCOORDINATOR.removeActivityIndicator()
            
            // lists data delegate
            listsDelegate?.PRListInformationObtained(list: pullRequests)
            
            // Get First Diff
            getPullRequestDiff(owner: DEFAULT_REPOSITORY_OWNER,
                               repo: DEFAULT_REPOSITORY_NAME,
                               number: String(pullRequests.first!.pullRequestNumber))
        
        } else {
            VIEWCOORDINATOR.removeActivityIndicator()
            print("NO PULL REQUESTS FOUND \n")
        }
        
    }
    
    /// RAW
    /// To get Diff data
    func rawDataToString(data: Data){
        print("\n\nDATA MANAGER: Compounded Pull Diff\n\n")
        
        let rawData = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
        print("\(rawData!)\n\n")
        
        let diff = PullRequestDiff(content: rawData! as String)
        pullRequestDiff = diff
        
        VIEWCOORDINATOR.removeActivityIndicator()
        
        // detail delegate
        diffDelegate?.PRDiffObtained(diff: pullRequestDiff!)
        
    }
    
}
