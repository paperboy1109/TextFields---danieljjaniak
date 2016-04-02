//
//  ZipCodeTextFieldDelegate.swift
//  TextFields - danieljjaniak
//
//  Created by Daniel J Janiak on 3/27/16.
//  Copyright © 2016 Daniel J Janiak. All rights reserved.
//

import Foundation
import UIKit

class ZipCodeTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    
    // Text Field Delegate Methods
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        let maxLength = 5
        
        if let userInput = textField.text {
            if ( (Int(string) != nil) && (userInput.characters.count < maxLength)) {
                return true
            } else {
                return false
            }
        }
        
        return false
    }
    
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true;
    }
    
    
    func textFieldDidBeginEditing(textField: UITextField) {
        textField.text = ""
    }
    
    
    
    
    
    
}
