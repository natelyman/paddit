//
//  Network.swift
//  paddit
//
//  Created by Nate Lyman on 6/5/14.
//  Copyright (c) 2014 NateLyman.com. All rights reserved.
//

import Foundation

class Network {
    
    var baseUrl : String
    var defaultHeaders : Dictionary<String,String>?
    
    init(baseUrl : String) {
        self.baseUrl = baseUrl
    }
    
    func get(path : String, completionHandler : (data : NSData?)->(), failureHandler : (error : NSError)->()) {
        self.get(path,params:nil,completionHandler:completionHandler,failureHandler:failureHandler)
    }
    
    func get(path : String, params : Dictionary<String,String>?, completionHandler : (data : NSData?)->(), failureHandler : (error : NSError)->()) {
        
        self.request("GET", path: path, params: params, completionHandler: completionHandler, failureHandler: failureHandler)
    }
    
    func post(path : String, completionHandler : (data : NSData?)->(), failureHandler : (error : NSError)->()) {
        self.post(path,params:nil,completionHandler:completionHandler,failureHandler:failureHandler)
    }
    
    func post(path : String, params : Dictionary<String,String>?, completionHandler : (data : NSData?)->(), failureHandler : (error : NSError)->()) {
        
        self.request("POST", path: path, params: params, completionHandler: completionHandler, failureHandler: failureHandler)
    }
    
    func put(path : String, completionHandler : (data : NSData?)->(), failureHandler : (error : NSError)->()) {
        self.put(path,params:nil,completionHandler:completionHandler,failureHandler:failureHandler)
    }
    
    func put(path : String, params : Dictionary<String,String>?, completionHandler : (data : NSData?)->(), failureHandler : (error : NSError)->()) {
        
        self.request("PUT", path: path, params: params, completionHandler: completionHandler, failureHandler: failureHandler)
    }
    
    func request(method : String?, path : String, params : Dictionary<String,String>?, completionHandler : (data : NSData?)->(), failureHandler : (error : NSError)->()) {
        
        var request = NSMutableURLRequest(URL: NSURL(string:self.baseUrl+path))
        
        if let verbValue = method {
            request.HTTPMethod = verbValue
        }else{
            request.HTTPMethod = "GET"
        }
        
        if let paramValues = params {
            for (key,value) in paramValues {
                request.setValue(value, forHTTPHeaderField: key)
            }
        }
        
        NSURLSession.sharedSession().dataTaskWithRequest(request){(data:NSData!, response:NSURLResponse!, error:NSError!) in
            
            if error {
                failureHandler(error:error)
                return
            }
            
            completionHandler(data: data)
            
            }.resume()
    }
    
    
}