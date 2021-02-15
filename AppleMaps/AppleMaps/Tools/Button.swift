//
//  Button.swift
//  AppleMaps
//
//  Created by ALYASI on 15/02/2021.
//

import UIKit
class Button: UIButton {
    
    @IBInspectable var fillColor : UIColor = UIColor.red
    override func didMoveToWindow() {
       self.layer.borderWidth = 0.0
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.borderColor = UIColor.gray.cgColor
        self.tintColor = UIColor.white
        self.layer.cornerRadius = 10
        
        self.layer.shadowOffset = CGSize(width: 0, height: 8)
        self.layer.shadowOpacity = 0.3
        self.layer.shadowRadius = 8
    }
    
}
