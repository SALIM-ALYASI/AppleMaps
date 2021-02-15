//
//  GoMAPS.swift
//  AppleMaps
//
//  Created by ALYASI on 15/02/2021.
//

import Foundation
import UIKit
class GoogleMap {
   
         static func Map(_ inViewController: UIViewController,latitude: String,longitude: String ){
                     if UIApplication.shared.canOpenURL(URL(string:"comgooglemaps://")!) {
                               UIApplication.shared.open(URL(string:"comgooglemaps://?saddr=&daddr=\(latitude),\(longitude)&directionsmode=driving")!)
                            } else {
                           let alert = UIAlertController(title: NSLocalizedString("تحذير" , comment: "") , message: "Google Map", preferredStyle: .alert)
                                                        alert.addAction(UIAlertAction(title:"تثبيت" , style: .default, handler: { action in
                                                         UIApplication.shared.open(URL(string:"https://apps.apple.com/us/app/google-maps-transit-food/id585027354" )!)
                                                        }))
                                                     
                                                        alert.addAction(UIAlertAction(title:       "الغاء", style: .default, handler: { (_) in
                                                            print("User click Dismiss button")
                                                        }))
                                                        inViewController.present(alert, animated: true)
                            
                }
         }
       
}

class Applemaps {
   
        static func Map(_ inViewController: UIViewController,latitude: String,longitude: String ){
              
                    if UIApplication.shared.canOpenURL(URL(string:"https://maps.apple://")!) {
                              UIApplication.shared.open(URL(string:"https://maps.apple.com/?address=\(latitude),\(longitude)=m")!)
                           } else {
                          let alert = UIAlertController(title:"", message:  "", preferredStyle: .alert)
                                       
                                                       alert.addAction(UIAlertAction(title:   NSLocalizedString("Installations", comment: "") , style: .default, handler: { action in
                                                        UIApplication.shared.open(URL(string:"https://apps.apple.com/us/app/maps/id915056765" )!)
                                                       }))
                                                    
                                                       alert.addAction(UIAlertAction(title:       "الغاء", style: .default, handler: { (_) in
                                                           print("User click Dismiss button")
                                                       }))
                        inViewController.present(alert, animated: true)
                           
               }
        }
       
}
class GoMaps {
    static  func Map(_ inViewController: UIViewController,latitude: String,longitude: String ){
   let alert = UIAlertController(title:NSLocalizedString("Choose", comment: ""), message:  NSLocalizedString("Please  select ", comment: ""), preferredStyle: .alert)
                                                             
                alert.addAction(UIAlertAction(title:    "GoogleMap" , style: .default, handler: { action in
                
    GoogleMap.Map(inViewController, latitude: latitude, longitude: longitude)
                                                                                          }))
        alert.addAction(UIAlertAction(title:  "Apple maps"   , style: .default, handler: { action in
                                                                                                       
    Applemaps.Map(inViewController, latitude: latitude, longitude: longitude)
                                                                                                      }))
        alert.addAction(UIAlertAction(title:    "الغاء", style: .default, handler: { (_) in
        print("User click Dismiss button")
                                                                             }))
            inViewController.present(alert, animated: true)

        }
}

