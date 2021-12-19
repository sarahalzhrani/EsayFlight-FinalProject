//
//  Location.swift
//  EsayFlight
//
//  Created by sara al zhrani on 20/04/1443 AH.
//
import UIKit
import GoogleMaps
import CoreLocation


class Location : UIViewController, GMSMapViewDelegate, CLLocationManagerDelegate {
    
    var locationManger =  CLLocationManager()
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GMSServices.provideAPIKey("AIzaSyBIK9hjJL22eUNODzEXz0XK-D7qViPgBc4")
        locationManger.requestAlwaysAuthorization()
        locationManger.startUpdatingLocation()
        locationManger.delegate = self
        
        
        
        let camera = GMSCameraPosition.camera(withLatitude: 21.6620073, longitude:  39.1733616, zoom: 40)
        let mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
        self.view.addSubview(mapView)
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 21.6620073, longitude:  39.1733616)
        marker.title = "Airport"
        marker.snippet = "Jeddah"
        marker.map = mapView
       
        let marker1 = GMSMarker()
        marker1.position = CLLocationCoordinate2D(latitude: 21.6620073, longitude:  39.1733616)
        marker1.title = "Coffee"
        marker1.snippet = "Airport Jeddah"
        marker1.map = mapView
        
        let marker2 = GMSMarker()
        marker2.position = CLLocationCoordinate2D(latitude: 21.6620073, longitude:  39.1733616)
        marker2.title = "Restaurant"
        marker2.snippet = "Airport Jeddah"
        marker2.map = mapView
         
        let marker3 = GMSMarker()
        marker3.position = CLLocationCoordinate2D(latitude: 21.6620073, longitude:  39.1733616)
        marker3.title = "Medical"
        marker3.snippet = "Airport Jeddah"
        marker3.map = mapView
    
        
    }
    
    
    }
