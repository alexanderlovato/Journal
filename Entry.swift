//
//  Entry.swift
//  Journal
//
//  Created by Alexander Lovato on 5/1/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class Entry: Equatable {
    
    private let timeStampKey = "timeStamp"
    private let titleKey = "title"
    private let bodyTextKey = "bodyTextKey"
    
    //  The variables below are the properties of the model and are the blueprint. They are where your apps data is stored, which can be changed and manipulated throughout it's use. Remember the blueprint and the (user's) data are the two parts of the model.
    
    var timeStamp: NSDate
    var title: String
    var bodyText: String
    
    
    init(timeStamp: NSDate = NSDate(), title: String, bodyText: String) {
        
        self.timeStamp = timeStamp
        self.title = title
        self.bodyText = bodyText
        
    }
    
    init?(dictionary: [String: AnyObject]){
        
        guard let timeStamp = dictionary[timeStampKey] as? NSDate,
        let title = dictionary[titleKey] as? String,
            let bodyText = dictionary[bodyTextKey] as? String else {
                
                
                return nil
        }
        
        self.timeStamp = timeStamp
        self.title = title
        self.bodyText = bodyText
       
        
        
    }
    
    func dictionaryCopy() -> Dictionary<String, AnyObject> {
        let dictionary = [
            timeStampKey : self.timeStamp,
            titleKey : self.title,
            bodyTextKey : self.bodyText
        ]
        return dictionary
    }
}

func ==(lhs: Entry, rhs: Entry) -> Bool {
    return lhs.timeStamp == rhs.timeStamp && lhs.title == rhs.title && lhs.bodyText == rhs.bodyText
}