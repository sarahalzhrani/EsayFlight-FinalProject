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
        
        
        
        let camera = GMSCameraPosition.camera(withLatitude: 21.6620073, longitude:  39.1733616, zoom: 18)
                let mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
                self.view.addSubview(mapView)

                // Creates a marker in the center of the map.
                let marker = GMSMarker()
                marker.position = CLLocationCoordinate2D(latitude: 21.6620073, longitude:  39.1733616)
                marker.title = "Airport"
                marker.snippet = "Jeddah"
                marker.map = mapView
          }
        
     
    
    }
