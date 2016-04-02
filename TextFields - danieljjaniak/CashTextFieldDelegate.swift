//
//  CashTextFieldDelegate.swift
//  TextFields - danieljjaniak
//
//  Created by Daniel J Janiak on 3/28/16.
//  Copyright © 2016 Daniel J Janiak. All rights reserved.
//

import Foundation
import UIKit

class CashTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    var cashText = String()
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        
        cashText += string;
        textField.text = formatter.stringFromNumber((NSString(string: cashText).doubleValue)/100)
        
        
        // * Returning false allows us to completely control the display of textField.text
        return false
    }




}