//
//  ViewController.swift
//  Where Am I
//
//  Created by Rickey Hrabowskie on 6/8/16.
//  Copyright © 2016 Rickey Hrabowskie. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    var manager:CLLocationManager!
    
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var courseLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var altitudeLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        print(locations)
        
        let userLocation:CLLocation = locations[0]
        
        self.latitudeLabel.text = String(userLocation.coordinate.latitude)
        
        self.longitudeLabel.text = String(userLocation.coordinate.longitude)
        
        self.courseLabel.text = String(userLocation.course)
        
        self.speedLabel.text = String(userLocation.speed)
        
        self.altitudeLabel.text = String(userLocation.altitude)
        
        CLGeocoder().reverseGeocodeLocation(userLocation, completionHandler: { (placemarks: [CLPlacemark]?, error: NSError?) -> Void in
            
            if (error != nil) {
                
                print(error)
                
            } else {
                
                if let p = placemarks?[0] {
                
                    var subThoroughfare:String = ""
                    var thoroughfare:String = ""
                    var subLocality:String = ""
                    var subAdministrativeArea:String = ""
                    var postalCode:String = ""
                    var country:String = ""
                    
                    if (p.subThoroughfare != nil) {
                        subThoroughfare = p.subThoroughfare!
                    }
                    
                    if (p.thoroughfare != nil) {
                        thoroughfare = p.thoroughfare! + "\n"
                    }
                    
                    if (p.subLocality != nil) {
                        subLocality = p.subLocality! + "\n"
                    }
                    
                    if (p.subAdministrativeArea != nil) {
                        subAdministrativeArea = p.subAdministrativeArea! + "\n"
                    }
                    
                    if (p.postalCode != nil) {
                        postalCode = p.postalCode! + "\n"
                    }
                    
                    if (p.country != nil) {
                        country = p.country!
                    }
                    
                    self.addressLabel.text = "\(subThoroughfare) \(thoroughfare) \(subLocality) \(subAdministrativeArea) \(postalCode) \(country)"
                }
                
            }
        })
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

