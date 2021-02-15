//
//  MapsViewController.swift
//  AppleMaps
//
//  Created by ALYASI on 15/02/2021.
//

var  longitude:String?
var  latitude:String?
var locationlongitudeData:Bool?
import UIKit
import MapKit
class MapsViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate, UISearchBarDelegate {
        
       
        // MARK: - Outlets
        let annotation2 = MKPointAnnotation()
        @IBOutlet weak var mapView: MKMapView!
        
        // MARK: - Search
        var Users = ""
        
        fileprivate var searchController: UISearchController!
        fileprivate var localSearchRequest: MKLocalSearch.Request!
        fileprivate var localSearch: MKLocalSearch!
        fileprivate var localSearchResponse: MKLocalSearch.Response!
        
        // MARK: - Map variables
        
        fileprivate var annotation: MKAnnotation!
        fileprivate var locationManager: CLLocationManager!
        fileprivate var isCurrentLocation: Bool = false
        
        // MARK: - Activity Indicator
        
        fileprivate var activityIndicator: UIActivityIndicatorView!
        
        // MARK: - UIViewController's methods
        
        override func viewDidLoad() {
            super.viewDidLoad()
            mySiteLabel.text = ""
            selectedSiteLabel.text = ""
           direction1.layer.borderColor = UIColor.black.cgColor
            direction1.layer.cornerRadius = direction1.frame.height / 2
             second.layer.cornerRadius = 10
            second.layer.shadowOffset = CGSize(width: 0, height: 8)
            second.layer.shadowOpacity = 0.3
            second.layer.shadowRadius = 8
               if #available(iOS 13.0, *) {
               }else{
                second.backgroundColor = #colorLiteral(red: 0.4795075059, green: 0.6119688153, blue: 0.6108606458, alpha: 1)
                second.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }
             
       
        mapView.delegate = self
     
            activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
            activityIndicator.hidesWhenStopped = true
            self.view.addSubview(activityIndicator)
            mapView.delegate = self
                 let longTapGesture = UILongPressGestureRecognizer(target: self, action: #selector(longTap))
                 mapView.addGestureRecognizer(longTapGesture)
        }
        func setupView() {
               self.title = NSLocalizedString("B1", comment: "")
           }
     
           @objc func longTap(sender: UIGestureRecognizer){
                   isCurrentLocation = false
                if sender.state == .began {
                     
                    let locationInView = sender.location(in: mapView)
                    let locationOnMap = mapView.convert(locationInView, toCoordinateFrom: mapView)
        //
                    addAnnotation(location: locationOnMap)
                }
            }
         @IBOutlet weak var imageview: UIImageView!
         @IBOutlet weak var button1: UIButton!
         @IBOutlet weak var button2: UIButton!
     
       
            func addAnnotation(location: CLLocationCoordinate2D){
            print(1)
            annotation2.coordinate = location
           annotation2.title = "\( location.latitude),\(location.longitude)"
                selectedSite = true
            latitudeselectedSite = "\( location.latitude)"
            longitudeselectedSite = "\(location.longitude)"
            self.mapView.addAnnotation(annotation2)
                selectedSiteLabel.text = "أرسل الموقع المختار"
            }
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            activityIndicator.center = self.view.center
        }
        
        var mySite:Bool?
        
        var  longitudemySite:String?
        var  latitudemySite:String?
        @IBOutlet weak var second: UISegmentedControl!
        @IBOutlet weak var mySiteLabel: UILabel!
       @IBAction func mySiteButton(_ sender: Any) {
        if mySite == true {
            locationlongitudeData = true
            latitude = latitudemySite
            longitude = longitudemySite
            dismiss(animated: true)
        }
     
        }
    //
        var selectedSite:Bool?
        var  longitudeselectedSite:String?
        var  latitudeselectedSite:String?
        @IBOutlet weak var selectedSiteLabel: UILabel!
       @IBAction func selectedSiteButton(_ sender: Any) {
        if selectedSite == true {
            locationlongitudeData = true
            latitude = latitudeselectedSite
            longitude = longitudeselectedSite
            dismiss(animated: true)
        }
        
     }
      
        @IBAction func backButton(_ sender: Any) {
         dismiss(animated: true)
      }
       @objc func searchButtonAction(_ button: UIBarButtonItem) {
     
            if searchController == nil {
                searchController = UISearchController(searchResultsController: nil)
            }
            searchController.hidesNavigationBarDuringPresentation = false
            self.searchController.searchBar.delegate = self
            present(searchController, animated: true, completion: nil)
        }
        
        @IBAction func asdf(_ sender: Any) {
              print(1)
            switch second.selectedSegmentIndex{
            case 0 :
                print(0)
                mapView.mapType = .satellite
            case 1:
                print(1)
             mapView.mapType = .hybrid
            case 2:
                print(2)
             mapView.mapType = .mutedStandard
            default:
                          
                          break
                          //
                      }
        }
     
        
        
        @IBAction func direction(_ sender: Any) {
         if (CLLocationManager.locationServicesEnabled()) {
                        if locationManager == nil {
                            locationManager = CLLocationManager()
                        }
                        locationManager?.requestWhenInUseAuthorization()
                        locationManager.delegate = self
                        locationManager.desiredAccuracy = kCLLocationAccuracyBest
                        locationManager.requestAlwaysAuthorization()
                        locationManager.startUpdatingLocation()
                        isCurrentLocation = true
                    }
            
        }
        
        
        @IBOutlet weak var direction1: UIButton!
        // MARK: - UISearchBarDelegate
        
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            searchBar.resignFirstResponder()
            
            dismiss(animated: true, completion: nil)
            
            if self.mapView.annotations.count != 0 {
                annotation = self.mapView.annotations[0]
                 self.mapView.removeAnnotation(annotation)
            }
            
            localSearchRequest = MKLocalSearch.Request()
            localSearchRequest.naturalLanguageQuery = searchBar.text
            localSearch = MKLocalSearch(request: localSearchRequest)
            localSearch.start { [weak self] (localSearchResponse, error) -> Void in
                
                if localSearchResponse == nil {
                    let alert = UIAlertView(title: nil, message: "   ", delegate: self, cancelButtonTitle: " ")
                    alert.show()
                   
                    return
                }
                
                let pointAnnotation = MKPointAnnotation()
                 searchBar.keyboardType = .numberPad
                pointAnnotation.title = searchBar.text
    //            self!.labal23.text = searchBar.text
    //            print("labal23:",self!.labal23.text as Any )
                pointAnnotation.subtitle = "\(localSearchResponse!.boundingRegion.center.latitude),\(localSearchResponse!.boundingRegion.center.longitude)"
             
                pointAnnotation.coordinate = CLLocationCoordinate2D(latitude: localSearchResponse!.boundingRegion.center.latitude, longitude: localSearchResponse!.boundingRegion.center.longitude)
                
                let pinAnnotationView = MKPinAnnotationView(annotation: pointAnnotation, reuseIdentifier: nil)
                self!.mapView.centerCoordinate = pointAnnotation.coordinate
                self!.mapView.addAnnotation(pinAnnotationView.annotation!)
            }
        }
     
        
        // MARK: - CLLocationManagerDelegate
        
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            
            if !isCurrentLocation {
                return
            }
            
            isCurrentLocation = false
            
            let location = locations.last
            let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
            let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
            
            self.mapView.setRegion(region, animated: true)
            
            if self.mapView.annotations.count != 0 {
                annotation = self.mapView.annotations[0]
                self.mapView.removeAnnotation(annotation)
            }
            
              let pointAnnotation = MKPointAnnotation()
            pointAnnotation.coordinate = location!.coordinate
            pointAnnotation.title = "\(location!.coordinate.latitude),\(location!.coordinate.longitude)"
            mySite = true
            latitudemySite =  "\(location!.coordinate.latitude)"
            longitudemySite =  "\(location!.coordinate.longitude)"
            mySiteLabel.text = "إرسال موقعي الحالي"
            mapView.addAnnotation(pointAnnotation)
        }

      
    }
