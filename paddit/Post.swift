//
//  Post.swift
//  paddit
//
//  Created by Nate Lyman on 6/4/14.
//  Copyright (c) 2014 NateLyman.com. All rights reserved.
//

import Foundation


class Post {
    
    var approvedBy : String!
    var author : String?
    var clicked = false
    var created : NSDate?
    var domain : String?
    var downs = 0
    var id : String?
    var isSelf = false
    var numComments = 0
    var over18 = false
    var permalink : String?
    var score = 0
    var thumbnail : String?
    var title : String?
    var ups = 0
    var url : String?
    
    func unwrapAnyObjectFromDictionary(key : String, object : Dictionary<String,AnyObject>) -> AnyObject? {
        
        let obj : AnyObject? = object[key]
        
        return obj
    }
    
    init(object : Dictionary<String,AnyObject>) {
        //println("Object: \(object)")
        let dataObject : AnyObject? = object["data"]
        
        if let data = dataObject as? Dictionary<String,AnyObject> {
            
            if let value = self.unwrapAnyObjectFromDictionary("approved_by", object: data) as? String {
                self.approvedBy = value
            }
            
            if let value = self.unwrapAnyObjectFromDictionary("author", object: data) as? String {
                self.author = value
            }
            
            if let value = self.unwrapAnyObjectFromDictionary("clicked", object: data) as? NSNumber {
                self.clicked = value.boolValue
            }
            
            if let value = self.unwrapAnyObjectFromDictionary("created_utc", object: data) as? NSNumber {
                self.created = NSDate(timeIntervalSince1970: value.doubleValue)
            }
            
            if let value = self.unwrapAnyObjectFromDictionary("domain", object: data) as? String {
                self.domain = value
            }
            
            if let value = self.unwrapAnyObjectFromDictionary("downs", object: data) as? NSNumber {
                self.downs = value.integerValue
            }
            
            if let value = self.unwrapAnyObjectFromDictionary("id", object: data) as? String {
                self.id = value
            }
            
            if let value = self.unwrapAnyObjectFromDictionary("is_self", object: data) as? NSNumber {
                self.isSelf = value.boolValue
            }
            
            if let value = self.unwrapAnyObjectFromDictionary("num_comments", object: data) as? NSNumber {
                self.numComments = value.integerValue
            }
            
            if let value = self.unwrapAnyObjectFromDictionary("over_18", object: data) as? NSNumber {
                self.over18 = value.boolValue
            }
            
            if let value = self.unwrapAnyObjectFromDictionary("permalink", object: data) as? String {
                self.permalink = value
            }
            
            if let value = self.unwrapAnyObjectFromDictionary("score", object: data) as? NSNumber {
                self.score = value.integerValue
            }
            
            if let value = self.unwrapAnyObjectFromDictionary("thumbnail", object: data) as? String {
                self.thumbnail = value
            }
            
            if let value = self.unwrapAnyObjectFromDictionary("title", object: data) as? String {
                self.title = value
            }
            
            if let value = self.unwrapAnyObjectFromDictionary("ups", object: data) as? NSNumber {
                self.ups = value.integerValue
            }
            
            if let value = self.unwrapAnyObjectFromDictionary("url", object: data) as? String {
                self.url = value
            }
            
            
        }

    }
}