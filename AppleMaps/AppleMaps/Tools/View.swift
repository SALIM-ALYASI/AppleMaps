//
//  View.swift
//  AppleMaps
//
//  Created by ALYASI on 15/02/2021.
//

import UIKit
class ViewArched:  UIView {
    override func didMoveToWindow() {
        self.layer.cornerRadius = 10
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.layer.shadowOpacity = 0.3
        self.layer.shadowRadius = 2.0
     }
}
