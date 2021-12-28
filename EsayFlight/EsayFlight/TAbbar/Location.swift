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
        
        
        
        let camera = GMSCameraPosition.camera(withLatitude: 21.6620073, longitude:  39.1733616, zoom: 15.0)
        let mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
        self.view.addSubview(mapView)
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 21.6620073, longitude:  39.1733616)
        marker.title = "Airport"
        marker.snippet = "Jeddah"
        marker.map = mapView
       
        let marker1 = GMSMarker()
        marker1.position = CLLocationCoordinate2D(latitude: 21.6599364, longitude:  39.1762277)
        marker1.title = NSLocalizedString("Parking", comment:"")
        marker1.icon = GMSMarker.markerImage(with: .purple)
        marker1.snippet = "Airport Jeddah"
        marker1.tracksInfoWindowChanges = true
        marker1.infoWindowAnchor = CGPoint(x: 0.5, y: 0.5)
        marker1.map = mapView
        
        let marker2 = GMSMarker()
        marker2.position = CLLocationCoordinate2D(latitude: 21.65887, longitude:  39.1714415)
        marker2.title = NSLocalizedString("Parking", comment:"")
        marker2.icon = GMSMarker.markerImage(with: .purple)
        marker2.snippet = "Airport Jeddah"
        marker2.map = mapView
         
        let marker3 = GMSMarker()
        marker3.position = CLLocationCoordinate2D(latitude: 21.6588242, longitude:  39.171946)
        marker3.title = NSLocalizedString("Rent Car Office", comment:"")
        marker3.icon = GMSMarker.markerImage(with: .purple)
        marker3.snippet = "Airport Jeddah"
        marker3.map = mapView
    
        let marker4 = GMSMarker()
        marker4.position = CLLocationCoordinate2D(latitude: 21.6627292, longitude:  39.1739886)
        marker4.title =  NSLocalizedString("Alfursan Terminal", comment:"")
        marker4.icon = GMSMarker.markerImage(with: .yellow)
        marker4.snippet = "Airport Jeddah"
        marker4.map = mapView
    
        let marker5 = GMSMarker()
        marker5.position = CLLocationCoordinate2D(latitude: 21.6631389, longitude:  39.1737778)
        marker5.title = NSLocalizedString("terminal1", comment:"")
        marker5.icon = GMSMarker.markerImage(with: .yellow)
        marker5.snippet = "Airport Jeddah"
        marker5.map = mapView
        
        
        
        let marker6 = GMSMarker()
        marker6.position = CLLocationCoordinate2D(latitude: 21.6605891, longitude:  39.1738266)
       marker6.title = NSLocalizedString("Train Station", comment:"")
       marker6.icon = UIImage(systemName: "house")
        marker6.icon = GMSMarker.markerImage(with: .yellow)
        marker6.snippet = "Airport Jeddah"
        marker6.map = mapView
    
    
    }
    
    
    }
