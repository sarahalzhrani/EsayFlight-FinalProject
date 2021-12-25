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
        
        
        
        let camera = GMSCameraPosition.camera(withLatitude: 21.6620073, longitude:  39.1733616, zoom: 1000)
        let mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
        self.view.addSubview(mapView)
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 21.6620073, longitude:  39.1733616)
        marker.title = "Airport"
        marker.snippet = "Jeddah"
        marker.map = mapView
       
        let marker1 = GMSMarker()
        marker1.position = CLLocationCoordinate2D(latitude: 21.6599364, longitude:  39.1762277)
        marker1.title = "Parking"
        marker1.icon = GMSMarker.markerImage(with: .purple)
//       marker1.icon = UIImage(named: "house")
        marker1.snippet = "Airport Jeddah"
        marker1.tracksInfoWindowChanges = true
        marker1.infoWindowAnchor = CGPoint(x: 0.5, y: 0.5)
        marker1.map = mapView
        
        let marker2 = GMSMarker()
        marker2.position = CLLocationCoordinate2D(latitude: 21.65887, longitude:  39.1714415)
        marker2.title = "Parking2"
        marker2.icon = GMSMarker.markerImage(with: .purple)
        marker2.snippet = "Airport Jeddah"
        marker2.map = mapView
         
        let marker3 = GMSMarker()
        marker3.position = CLLocationCoordinate2D(latitude: 21.663145, longitude:  39.173783)
        marker3.title = "Parking3"
        marker3.icon = GMSMarker.markerImage(with: .purple)
        marker3.snippet = "Airport Jeddah"
        marker3.map = mapView
    
        let marker4 = GMSMarker()
        marker3.position = CLLocationCoordinate2D(latitude: 21.6666382, longitude:  39.1713578)
        marker4.title = "Starbucks"
        marker4.icon = GMSMarker.markerImage(with: .yellow)

        marker4.snippet = "Airport Jeddah"
        marker4.map = mapView
    
        let marker5 = GMSMarker()
        marker5.position = CLLocationCoordinate2D(latitude: 21.6611098, longitude:  39.1739889)
        marker5.title = "Albaik"
        marker5.icon = GMSMarker.markerImage(with: .yellow)

        marker5.snippet = "Airport Jeddah"
        marker5.map = mapView
        
        
        
        let marker6 = GMSMarker()
        marker6.position = CLLocationCoordinate2D(latitude: 21.6675863, longitude:  39.1712386)
        marker6.title = "subway"
       marker6.icon = UIImage(systemName: "house")

        marker6.icon = GMSMarker.markerImage(with: .yellow)

        marker6.snippet = "Airport Jeddah"
        marker6.map = mapView
    
    
    }
    
    
    }
