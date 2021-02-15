//
//  GoSite.swift
//  AppleMaps
//
//  Created by ALYASI on 15/02/2021.
//
import UIKit

class MAPSclass{
 
    
    func alert()->MapsViewController{
        let storyBoard = UIStoryboard(name: "MapsStoryboard", bundle: .main)
        let alertVC = storyBoard.instantiateViewController(withIdentifier: "MapsViewController") as! MapsViewController
        
     
        return alertVC
    }
    
}
