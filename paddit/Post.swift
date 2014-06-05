//
//  Post.swift
//  paddit
//
//  Created by Nate Lyman on 6/4/14.
//  Copyright (c) 2014 NateLyman.com. All rights reserved.
//

import Foundation


class Post {
    
    var approvedBy : String?
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
    
    
    init(object : Dictionary<String,AnyObject>) {
        
        let dataObject : AnyObject? = object["data"]
        
        if let data = dataObject as? Dictionary<String,AnyObject> {
            
            let approvedByObject : AnyObject? = data["approved_by"]
            
            if let approvedBy = approvedByObject as? String {
                self.approvedBy = approvedBy
            }
            
            let authorObject : AnyObject? = data["author"]
            
            if let author = authorObject as? String {
                self.author = author
            }
            
            let clickedObject : AnyObject? = data["clicked"]
            
            if let clicked = clickedObject as? NSNumber {
                self.clicked = clicked.boolValue
            }
            
            let createdObject : AnyObject? = data["created_utc"]
            
            if let created = createdObject as? NSNumber {
                self.created = NSDate(timeIntervalSince1970: created.doubleValue)
            }
            
            let domainObject : AnyObject? = data["domain"]
            
            if let domain = domainObject as? String {
                self.domain = domain
            }
            
            let downsObject : AnyObject? = data["downs"]
            
            if let downs = downsObject as? NSNumber {
                self.downs = downs.integerValue
            }
            
            let idObject : AnyObject? = data["id"]
            
            if let id = idObject as? String {
                self.id = id
            }
            
            let isSelfObject : AnyObject? = data["is_self"]
            
            if let isSelf = isSelfObject as? NSNumber {
                self.isSelf = isSelf.boolValue
            }
            
            let numCommentsObject : AnyObject? = data["num_comments"]
            
            if let numComments = numCommentsObject as? NSNumber {
                self.numComments = numComments.integerValue
            }
            
            let over18Object : AnyObject? = data["over_18"]
            
            if let over18 = over18Object as? NSNumber {
                self.over18 = over18.boolValue
            }
            
            let permalinkObject : AnyObject? = data["permalink"]
            
            if let permalink = permalinkObject as? String {
                self.permalink = permalink
            }
            
            let scoreObject : AnyObject? = data["score"]
            
            if let score = scoreObject as? NSNumber {
                self.score = score.integerValue
            }
            
            let thumbnailObject : AnyObject? = data["thumbnail"]
            
            if let thumbnail = thumbnailObject as? String {
                self.thumbnail = thumbnail
            }
            
            let titleObject : AnyObject? = data["title"]
            
            if let title = titleObject as? String {
                self.title = title
            }
            
            let upsObject : AnyObject? = data["ups"]
            
            if let ups = upsObject as? NSNumber {
                self.ups = ups.integerValue
            }
            
            let urlObject : AnyObject? = data["url"]
            
            if let url = urlObject as? String {
                self.url = url
            }
            
        }

    }
}