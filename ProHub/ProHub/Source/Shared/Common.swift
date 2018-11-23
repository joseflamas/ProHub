//
//  Common.swift
//  ProHub
//
//  Created by Guillermo Irigoyen on 11/21/18.
//  Copyright © 2018 Guillermo Irigoyen. All rights reserved.
//

import Foundation

/// MARK: - Main Components
// - commnet: Based in the Separation of Concerns (SoC) Principle

/// Application Manager
// - comment:   Controls all the interaction between the OS and the App
//              this includes, notifications, permitions, etc.
//              Only Singleton in the Application.
var APPMANAGER      :   AppManager!

/// View Coordinator
// - comment:   Acts as Views and Views Controllers Coordinator
//              Initialized by the Application Manager
var VIEWCOORDINATOR :   ViewsCoordinator!

/// Data Manager
// - comment:   Centralized place to handle persistent an ephimeral data
//              Initialized by the Application Manager
var DATAMANAGER     :   DataManager!

// Request Manager
/// - comment:   Centralized place to handle all requests
///              Initialized by the Application Manager
var REQUESTMANAGER  :   RequestManager!

/// TO-DO: Security Manager
// - comment:   Centralized place to handle all sensitive information

