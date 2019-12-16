//
//  UITextField.swift
//  MunchBakery
//
//  Created by Predrag Jevtic on 11/28/19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import UIKit

extension UITextField {

    @IBInspectable var paddingLeftCustom: CGFloat {
        get {
            return leftView!.frame.size.width
        }
        set {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: frame.size.height))
            leftView = paddingView
            leftViewMode = .always
        }
    }
    
    @IBInspectable var paddingRightCustom: CGFloat {
        get {
            return rightView!.frame.size.width
        }
        set {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: frame.size.height))
            rightView = paddingView
            rightViewMode = .always
        }
    }
    
    @IBInspectable var doneAccessory: Bool {
        get {
            return self.doneAccessory
        }
        set (hasDone) {
            if hasDone {
                addDoneButtonOnKeyboard()
            }
        }
    }
    
    func addDoneButtonOnKeyboard() {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default
        
        let cancel: UIBarButtonItem = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.done, target: self, action: #selector(self.cancelButtonAction))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))
        
        let items = [cancel, flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        self.inputAccessoryView = doneToolbar
    }
    
    @objc func doneButtonAction() {
        self.resignFirstResponder()
    }
    
    @objc func cancelButtonAction() {
        self.resignFirstResponder()
        self.text = ""
    }
    
}
