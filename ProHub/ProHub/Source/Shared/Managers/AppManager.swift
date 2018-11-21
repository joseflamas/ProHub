//
//  AppManager.swift
//  ProHub
//
//  Created by Guillermo Irigoyen on 11/21/18.
//  Copyright © 2018 Guillermo Irigoyen. All rights reserved.
//

import Foundation


/// Application Manager
/// - comment:   Controls all the interaction between the OS and the App
///              this includes, notifications, permitions, etc.
///              Only Singleton in the Application besides the Application Delegate.
final class AppManager {
    
    /// SharedManager
    /// - comment: Only singleton besides the delegate
    public static  let sharedManager  :   AppManager  =   AppManager()
    
    /// Initializers
    init() {
        print("Initializing Application Manager ...")
        
        /// Initialize all required components
        startApplicationComponents()
        
        /// Aplication ready Messages
        print("\n::::::::::::::::::::::::::::::::")
        print("::\t"+TEXT_APPLICATIONNAME)
        print("::\t"+TEXT_ALIVEMESSAGE)
        print("::\t"+TEXT_VERSIONCODENAME + " " + TEXT_VERSIONNUMBER)
        print("::::::::::::::::::::::::::::::::\n")
        
    }
    
    /// Initialize all the required components shared accross the application
    private func startApplicationComponents() {
        VIEWCOORDINATOR = ViewsCoordinator()
        DATAMANAGER     = DataManager()
        REQUESTMANAGER  = RequestManager()
        
    }
    
}
