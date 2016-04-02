//
//  LockableTextFieldDelegate.swift
//  TextFields - danieljjaniak
//
//  Created by Daniel J Janiak on 3/28/16.
//  Copyright © 2016 Daniel J Janiak. All rights reserved.
//

import Foundation
import UIKit

class LockableTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    let editingSwitch: UISwitch
    
    init(lockSwitch: UISwitch) {
        self.editingSwitch = lockSwitch
        super.init()
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        print(editingSwitch.on)
        return editingSwitch.on
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }

    
}