//
//  Reddit.swift
//  paddit
//
//  Created by Nate Lyman on 6/4/14.
//  Copyright (c) 2014 NateLyman.com. All rights reserved.
//

import Foundation

class Reddit : Network {
    
    init() {
        super.init(baseUrl: "http://www.reddit.com/")
    }
    
    func loadFrontPage(completionHandler:(Post[]) -> ()) {
        var rv = []
        
        let URL = NSURL.URLWithString("http://www.reddit.com/hot.json")
        
        self.get("hot.json", completionHandler: {(data: NSData?) in
            var err : NSError?
            let json : AnyObject! = NSJSONSerialization.JSONObjectWithData(data,options:nil,error:&err)
            
            if let jsonDict = json as? Dictionary<String,AnyObject> {
                let data : AnyObject? = jsonDict["data"]
                
                if let dataDict = data as? Dictionary<String,AnyObject> {
                    let children : AnyObject? = dataDict["children"]
                    
                    if let childrenArray = children as? Dictionary<String,AnyObject>[] {
                        
                        var posts = Post[]()
                        
                        for child in childrenArray {
                            let post = Post(object: child)
                            posts.append(post)
                        }
                        
                        completionHandler(posts)
                    }
                    
                }
            }
        }, failureHandler: {(error: NSError) in
            
        })
        
//        NSURLSession.sharedSession().dataTaskWithURL(URL, completionHandler: {(data: NSData!, response: NSURLResponse!, error: NSError!) in
//            
//            if error != nil {
//                println(error.description)
//            }else{
//                var err : NSError?
//                let json : AnyObject! = NSJSONSerialization.JSONObjectWithData(data,options:nil,error:&err)
//                
//                if let jsonDict = json as? Dictionary<String,AnyObject> {
//                    let data : AnyObject? = jsonDict["data"]
//                    
//                    if let dataDict = data as? Dictionary<String,AnyObject> {
//                        let children : AnyObject? = dataDict["children"]
//                        
//                        if let childrenArray = children as? Dictionary<String,AnyObject>[] {
//                            
//                            var posts = Post[]()
//                            
//                            for child in childrenArray {
//                                let post = Post(object: child)
//                                posts.append(post)
//                            }
//                            
//                            completionHandler(posts)
//                        }
//                        
//                    }
//                }
//            
//                
//            }
//            
//        }).resume()
        
    }
    
}

/*
{(data : NSData!, response : NSURLResponse!, error : NSError!) in

// your code

}

*/