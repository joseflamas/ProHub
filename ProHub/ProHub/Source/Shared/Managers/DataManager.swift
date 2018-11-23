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
    
    /// Initializers
    init(){
        print("Initializing Data Manager ...")

    }
    
    /// To get Pull Request
    func jsonDataToObject(data: Data){
        print("\n\nDATA MANAGER: Pull Requestes JSON Object\n\n")
        let jsonData = try! JSONSerialization.jsonObject(with: data, options: .allowFragments)
        // TO-DO: Replace Struct with a Codable Object?
        print("\(jsonData)\n\n")
        
    }
    
    /// To get Diff data
    func rawDataToString(data: Data){
        print("\n\nDATA MANAGER: Compound Pull Diff\n\n")
        let rawData = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
        print("\(rawData!)\n\n")
        
    }
    
}

//extension DataManager : SimpleRequestManagerDelegate {
//    func requestInProgress(stage: RequestState) {
//        switch stage {
//        case .configuration:
//        case .open:
//        case .completed:
//        }
//    }
//
//}
