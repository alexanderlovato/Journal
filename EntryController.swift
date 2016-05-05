//
//  EntryController.swift
//  Journal
//
//  Created by Alexander Lovato on 5/1/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class EntryController {
    
    static let sharedController = EntryController()
    
    private let entriesKey = "entries"
   
    
    var entries: [Entry]
    
    init() {
        self.entries = []
        self.loadFromPersistentStorage()
    }
    
    func addEntry(entry: Entry) {
        entries.append(entry)
        
        self.saveToPersistentStorage()
    }
    
    func removeEntry(entry: Entry) {
        
        if let entryIndex = entries.indexOf(entry) {
            entries.removeAtIndex(entryIndex)
            
            self.saveToPersistentStorage()
        }
        
        
        
        
    }
    
    
    func loadFromPersistentStorage() {
        
        let entryDictionariesFromDefaults = NSUserDefaults.standardUserDefaults().objectForKey(entriesKey) as? [Dictionary<String, AnyObject>]
        
        if let entryDictionaries = entryDictionariesFromDefaults {
            
            self.entries = entryDictionaries.map({Entry(dictionary: $0)!})
        }
    }
    

    func saveToPersistentStorage() {
        
        let entryDictionaries = self.entries.map({$0.dictionaryCopy()})
        
        NSUserDefaults.standardUserDefaults().setObject(entryDictionaries, forKey: entriesKey)
        
        
    }







}
