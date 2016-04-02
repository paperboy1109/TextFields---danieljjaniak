//
//  ViewController.swift
//  TextFields - danieljjaniak
//
//  Created by Daniel J Janiak on 3/23/16.
//  Copyright © 2016 Daniel J Janiak. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    // Outlets
    @IBOutlet var textField1: UITextField!
    @IBOutlet var textField2: UITextField!
    @IBOutlet var textField3: UITextField!
    @IBOutlet var cashTextField: UITextField!
    
    @IBOutlet var enableEditSwitch: UISwitch!
    
    // Variables
    var timer: NSTimer!
    
    // Text Field Delegate objects
    var randomColorDelegate = RandomColorTextFieldDelegate()
    var zipCodeDelegate = ZipCodeTextFieldDelegate()
    var cashDelegate = CashTextFieldDelegate()
    
    var lockableTextFieldDelegate: LockableTextFieldDelegate!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.textField1.delegate = randomColorDelegate
        self.textField2.delegate = zipCodeDelegate
        
        self.cashTextField.delegate = cashDelegate
        
        self.lockableTextFieldDelegate = LockableTextFieldDelegate(lockSwitch: enableEditSwitch)
        self.textField3.delegate = lockableTextFieldDelegate
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func allowEditingToggled(sender: UISwitch) {
        if !sender.on {
            textField3.endEditing(true)
        }
    }
    
    
    
    // Text Field Delegate Methods
    
//    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
//        
//        // Figure out what the new text will be, if we return true
//        var newText: NSString = textField.text!
//        newText = newText.stringByReplacingCharactersInRange(range, withString: string)
//        
//        // hide the label if the newText will be an empty string
//        //self.characterCountLabel.hidden = (newText.length == 0)
//        
//        // Write the length of newText into the label
//        //self.characterCountLabel.text = String(newText.length)
//        
//        
//        
//        // returning true gives the text field permission to change its text
//        return true;
//    }
    
    
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        let randomColor = UIColor(red: randomCGFloat(), green: randomCGFloat(), blue: randomCGFloat(), alpha: 1.0)
        self.view.backgroundColor = randomColor
        return true
    }
    
    func textFieldShouldClear(textField: UITextField) -> Bool {
        stopTimer()
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true;
    }
    
    func randomCGFloat() -> CGFloat {
        return CGFloat(Float(arc4random()) / Float(UINT32_MAX))
    }
    
    
    func textFieldDidBeginEditing(textField: UITextField) {
        
        textField.text = ""
        
        startTimer()
 
    }

    func updateBackgroundColor() {
        
        let randomColor = UIColor(red: randomCGFloat(), green: randomCGFloat(), blue: randomCGFloat(), alpha: 1.0)
        
        self.view.backgroundColor = randomColor
        
    }
    
    func startTimer() {
        // Stop any (already) existing timer
        if timer != nil {
            timer.invalidate()
        }
        
        timer = NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: "updateBackgroundColor", userInfo: nil, repeats: true)
    }
    
    func stopTimer() {
        // Stop any (already) existing timer
        if timer != nil {
            timer.invalidate()
        }
        
    }


}

