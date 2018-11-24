//
//  RequestManager.swift
//  ProHub
//
//  Created by Guillermo Irigoyen on 11/21/18.
//  Copyright © 2018 Guillermo Irigoyen. All rights reserved.
//

import Foundation


/// Pull Request States
enum ResponseFormatType {
    case json
    case raw
    
    var paramString : String {
        switch self {
        case .json : return "json"
        case .raw  : return "raw"
        }
    }
    
}

/// Request States
enum RequestState {
    case configuration
    case inProgress
    case completed
    
    var string : String {
        switch self {
        case .configuration : return "configuration"
        case .inProgress    : return "inProgress"
        case .completed     : return "completed"
        }
    }
}


/// Simple Request Protocol
protocol SimpleRequestManagerDelegate {
    func simpleRequestInProgress(type: ResponseFormatType, stage: RequestState)
    func simpleRequestResponseObtained(response: HTTPURLResponse)
    func simpleRequestDataObtained(type: ResponseFormatType, data: Data)
    
}


/// Request Manager
/// - comment:   Centralized place to handle all requests
///              Initialized by the Application Manager
final class RequestManager {

    private var session : URLSession?
    private var request : URLRequest?
    
    var delegate : SimpleRequestManagerDelegate?
    
    /// Initializers
    init(){
        print("Initializing Request Manager ...")
        
    }
    
    /// Configurations
    /// Session
    private func configureDefaultSession() -> URLSession {
        print("REQUEST MANAGER: Configuring Default Session")
        
        let configuration : URLSessionConfiguration = .default
        let session       : URLSession              = URLSession(configuration: configuration)
        
        return session
    }
    
    /// Request
    private func configureDefaultRequest(toURL url: URL, method methodType: String = "GET", expiration seconds: Double = 15) -> URLRequest {
        print("REQUEST MANAGER: Configuring Default Request")
        
        var request : URLRequest = URLRequest(url: url)
        request.httpMethod       = methodType
        request.timeoutInterval  = seconds
        
        /// Headers
        /// - comment: v3 is the github recomended version as today
        request.addValue("application/vnd.github.v3.raw+json", forHTTPHeaderField: "Accept")
        
        return request
    }
    
    /// Request Tasks
    /// Simple
    func simpleRequestTo(to url: String, forResponseFormat formatType: ResponseFormatType = .json){
        delegate?.simpleRequestInProgress(type: formatType, stage: .configuration)
        
        session = configureDefaultSession()
        request = configureDefaultRequest(toURL: URL(string: url)!)
        
        print("REQUEST MANAGER: Requesting")
        delegate?.simpleRequestInProgress(type: formatType, stage: .inProgress)
        let simpleTask = session?.dataTask(with: request!, completionHandler: { data, response, error -> Void in
            /// TO-DO: properly handle errors
            print(error ?? "REQUEST MANAGER: NO ERROR")
            if error != nil { return }
            
            /// DEBUG HEADERS print("REQUEST MANAGER: \(response?.description ?? "REQUEST MANAGER: NO RESPONSE")")
            if let httpResponse = response as? HTTPURLResponse {
                self.delegate?.simpleRequestResponseObtained(response: httpResponse)
                
                if httpResponse.statusCode == 200 {
                    print("REQUEST MANAGER: PROCESSING RESPONSE")
                    
                    if data != nil {
                        self.delegate?.simpleRequestDataObtained(type: formatType, data: data!)
                            
                    }
                    print("REQUEST MANAGER: \(data?.description ?? "REQUEST MANAGER: NO DATA")")
                    
                }
            }
            self.delegate?.simpleRequestInProgress(type: formatType, stage: .completed)
        })
        
        simpleTask?.resume()
        
    }
    
    
    
}


