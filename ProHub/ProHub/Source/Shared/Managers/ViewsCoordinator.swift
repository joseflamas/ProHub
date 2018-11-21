//
//  ViewCoordinator.swift
//  ProHub
//
//  Created by Guillermo Irigoyen on 11/21/18.
//  Copyright © 2018 Guillermo Irigoyen. All rights reserved.
//

import Foundation
import UIKit


/// Graphical User Interface Manager
/// - comment:   Acts as Views and Views Controllers Coordinator
///              Handles push, pops, presentation, styling, etc
///              Initialized by the Application Manager
final class ViewsCoordinator {
    
    // Components
    private(set) var mainWindow               : UIWindow!
    private(set) var mainViewController       : UIViewController!
    private(set) var mainNavigationController : UINavigationController!
    private(set) var currentMainView          : UIView!
    
    
    // Initializers
    init(){
        print("Initializing View Coordinator ...")
        setInitalWindow()
        
    }
    
}


// MARK: - UIWindows
extension ViewsCoordinator {
    
    /// Used in the application delagete to set the main windoe and root navigation controller
    private func setInitalWindow() {
        mainWindow               = UIWindow(frame: UIScreen.main.bounds)
        mainViewController       = HubExplorerViewController(nibName: "HubExplorerViewController",
                                                                bundle: .main)
        mainViewController.title = TEXT_APPLICATIONNAME
        mainNavigationController = UINavigationController(rootViewController: mainViewController)
        
        // TO-DO: Styling
        
        
    }
    
    /// Used only when application loads
    ///
    /// - Returns: returns the initial window
    public func getInitialWindow() -> UIWindow {
        mainWindow.rootViewController = mainNavigationController
        return mainWindow
        
    }
    
    /// Convenience access to the main window
    ///
    /// - Returns: current main window
    public func getmainWindow() -> UIWindow {
        return mainWindow
        
    }
    
}

/// MARK: - UIViewController
extension ViewsCoordinator {
    
    /// Pushes a view controller
    ///
    /// - Parameter aViewController: the view controller to push
    public func pushViewController(_ aViewController: UIViewController){
        mainNavigationController.isNavigationBarHidden = false
        mainNavigationController.pushViewController(aViewController, animated: true)
        
    }
    
    /// Pops the current view controller
    public func popViewController(){
        mainNavigationController.popViewController(animated: true)
        
    }
    
    /// Presents a view controller
    ///
    /// - Parameter aViewController: the view controller to present
    /// - comment: Apple discurages presenting a view controllers on detached view controllers
    ///            but is still useful for alerts
    public func presentViewController(_ aViewController: UIViewController){
        mainWindow.rootViewController?.present(aViewController, animated: true, completion: nil)
        
    }
    
}

/// MARK: - Alerts
extension ViewsCoordinator {
    
    /// Presents a standard alert to the user
    ///
    /// - Parameters:
    ///   - aTitle: Title of the alert
    ///   - aMessage: description of the problem
    public func showAlert(withTitle aTitle: String, andMessage aMessage: String){
        let alert = UIAlertController(title: aTitle,
                                      message: aMessage,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        presentViewController(alert)
        
    }
    
    /// Presents an alert to the user outside the standard alert
    ///
    /// - Parameter someAlert: alert controller
    public func showAlert(alert someAlert: UIAlertController){
        presentViewController(someAlert)
        
    }
    
}


