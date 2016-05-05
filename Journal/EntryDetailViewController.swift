//
//  EntryDetailViewController.swift
//  Journal
//
//  Created by Alexander Lovato on 5/1/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController {
    
    
    
    var entry: Entry?
    

    @IBOutlet var titleTextField: UITextField!
   
    @IBOutlet var entryBodyTextField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clearAllText(sender: AnyObject) {
        // Why wasn't this ever explained?
        
        titleTextField.text = ""
        entryBodyTextField.text = ""
    }
    
    func updateWithEntry(entry: Entry) {
        self.entry = entry
        self.titleTextField.text = entry.title
        self.entryBodyTextField.text = entry.bodyText
    }
   
    @IBAction func saveSystemItem(sender: AnyObject) {
        
        if let entry = self.entry {
            entry.title = self.titleTextField.text!
            entry.bodyText = self.entryBodyTextField.text
            entry.timeStamp = NSDate()
        } else {
            let newEntry = Entry(title: self.titleTextField.text!, bodyText: self.entryBodyTextField.text)
            EntryController.sharedController.addEntry(newEntry)
            self.entry = newEntry
            
        }
       self.navigationController?.popViewControllerAnimated(true)
    }
 
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    // MARK: - Delegate Functions
    
    
    // How can you declare a new function with a function that's already in Swift? Lookup the method in the documentation.
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
        
    }
    
    


}
