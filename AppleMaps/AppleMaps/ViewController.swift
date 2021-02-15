//
//  ViewController.swift
//  AppleMaps
//
//  Created by ALYASI on 15/02/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var gositeButtontext: Button!
    @IBOutlet weak var siteLabel: UILabel!
    var latitudeData:String?
    var longitudeData:String?
    var timerTest = Timer()
     var time = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        gositeButtontext.isHidden = true
    }

    @objc func actionBundle()
       {
      
          time += 1
    
       if time <= 3{
              time = 0
              Site()
             
            }
}
    
  func Site() {
      if   locationlongitudeData == true {
          
           latitudeData = latitude
          longitudeData = longitude
        siteLabel.text =  latitudeData! + "," + longitudeData!
        if latitudeData != nil {
            gositeButtontext.isHidden = false
        }
    
      }
  }
    @IBAction func siteButton(_ sender: UIButton) {
        let alert = MAPSclass().alert()

       self.present(alert, animated: true)
        timerTest = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(actionBundle), userInfo: nil, repeats: true)
    }
//    Go to the sit
    @IBAction func gositeButton(_ sender: UIButton) {
        GoMaps.Map(self, latitude: latitudeData!, longitude: longitudeData!)
    }
    
}

