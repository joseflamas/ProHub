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
    
    // Activity Indicators
    private      var activityView             : UIView?
    private      var spinnerMessage           : UILabel?
    private      var spinner                  : UIActivityIndicatorView = UIActivityIndicatorView(style: .whiteLarge)
    
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


extension ViewsCoordinator {
    
    func  presentActivityIndicator(message: String = "WORKING") {
        DispatchQueue.main.async {
            let size : CGFloat = 180
            let currentFrame = self.mainViewController.view.frame
            self.activityView   = UIView(frame: CGRect(x: (currentFrame.size.width/2 - size/2),
                                                  y: (currentFrame.size.height/2 - size/2),
                                                  width: size, height: size))
            self.activityView?.backgroundColor = .black
            self.activityView?.layer.cornerRadius = 15
            
            self.spinnerMessage = UILabel(frame: CGRect(x: 10,
                                                   y: 5,
                                                   width: size - 20, height: 60))
            self.spinnerMessage?.text      = message
            self.spinnerMessage?.textColor = .white
            self.spinnerMessage?.numberOfLines = 3
            self.spinnerMessage?.textAlignment = .center
        
            self.spinner.frame  = CGRect(x: (self.activityView?.frame.size.height)!/2 - 25,
                                    y: (self.activityView?.frame.size.width)!/2,
                                    width: 50, height: 50)
            
            
            self.activityView?.addSubview(self.spinnerMessage!)
            self.activityView?.addSubview(self.spinner)
            
            self.spinner.startAnimating()
            
            self.mainViewController.view.addSubview(self.activityView!)
        }
    }
    
    func updateActivityMessage(message: String){
        DispatchQueue.main.async {
            self.spinnerMessage?.text = message
        }
    }
    
    func removeActivityIndicator(){
        DispatchQueue.main.async {
            self.spinnerMessage?.text = "READY"
            self.spinner.stopAnimating()
            self.activityView?.removeFromSuperview()
        }
    
    }
    
}

