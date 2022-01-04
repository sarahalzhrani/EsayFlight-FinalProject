//
//  Location.swift
//  EsayFlight
//
//  Created by sara al zhrani on 20/04/1443 AH.
//
import UIKit
import GoogleMaps
import CoreLocation
import MapKit



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
        mapView.settings.compassButton = true
        mapView.settings.myLocationButton = true
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
    func mapView(mapView: MKMapView, didSelectAnnotationView view: MKAnnotationView)
        {
            if let annotationTitle = view.annotation?.title
            {
                print("User tapped on annotation with title: \(annotationTitle!)")
            }
        }
       
 
    
    }
//    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
//
//        if marker.title != nil {
//
//            let mapViewHeight = mapView.frame.size.height
//            let mapViewWidth = mapView.frame.size.width
//
//
//            let container = UIView()
//            container.frame = CGRect(x: mapViewWidth - 100, y: mapViewHeight - 63, width: 65, height: 35)
//            container.backgroundColor = UIColor.white
//            self.view.addSubview(container)
//
//            let googleMapsButton = CustomButton()
//            googleMapsButton.setTitle("", for: .normal)
//            googleMapsButton.setImage(UIImage(named: "googlemaps"), for: .normal)
//            googleMapsButton.setTitleColor(UIColor.blue, for: .normal)
//            googleMapsButton.frame = CGRect(x: mapViewWidth - 80, y: mapViewHeight - 70, width: 50, height: 50)
//            googleMapsButton.addTarget(self, action: #selector(markerClick(sender:)), for: .touchUpInside)
//            googleMapsButton.gps = String(marker.position.latitude) + "," + String(marker.position.longitude)
//            googleMapsButton.setTitle(marker.title, for: .normal)
//            googleMapsButton.tag = 0
//
//            let directionsButton = CustomButton()
//
//            directionsButton.setTitle("", for: .normal)
//            directionsButton.setImage(UIImage(named: "googlemapsdirection"), for: .normal)
//            directionsButton.setTitleColor(UIColor.blue, for: .normal)
//            directionsButton.frame = CGRect(x: mapViewWidth - 110, y: mapViewHeight - 70, width: 50, height: 50)
//            directionsButton.addTarget(self, action: #selector(markerClick(sender:)), for: .touchUpInside)
//            directionsButton.gps = String(marker.position.latitude) + "," + String(marker.position.longitude)
//            directionsButton.setTitle(marker.title, for: .normal)
//            directionsButton.tag = 1
//            self.view.addSubview(googleMapsButton)
//            self.view.addSubview(directionsButton)
//        }
//        return true
//    }
//
//    @objc func markerClick(sender: CustomButton) {
//        let fullGPS = sender.gps
//        let fullGPSArr = fullGPS.split(separator: ",")
//
//        let lat1 : String = String(fullGPSArr[0])
//        let lng1 : String = String(fullGPSArr[1])
//
//
//        let latitude = Double(lat1) as! CLLocationDegrees
//        let longitude = Double(lng1) as! CLLocationDegrees
//
//        if (UIApplication.shared.canOpenURL(URL(string:"comgooglemaps://")!)) {
//
//            if (sender.tag == 1) {
//                let url = URL(string: "comgooglemaps://?saddr=&daddr=\(latitude),\(longitude)&directionsmode=driving")
//                UIApplication.shared.open(url!, options: [:], completionHandler: nil)
//            } else if (sender.tag == 0) {
//                let url = URL(string:"comgooglemaps://?center=\(latitude),\(longitude)&zoom=14&views=traffic&q=\(latitude),\(longitude)")
//                UIApplication.shared.open(url!, options: [:], completionHandler: nil)
//            }
//
//        } else {
//            let regionDistance:CLLocationDistance = 10000
//            let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
//            let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
//            var options = NSObject()
//            if (sender.tag == 1) {
//                options = [
//                    MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
//                    MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span),
//                    MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving
//                    ] as NSObject
//            } else if (sender.tag == 0) {
//                options = [
//                    MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
//                    MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
//                    ] as NSObject
//            }
//
//            let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
//            let mapItem = MKMapItem(placemark: placemark)
//            mapItem.name = sender.title(for: .normal)
//            mapItem.openInMaps(launchOptions: options as? [String : AnyObject])
//        }
//    }
//
//    class CustomButton: UIButton {
//        var gps = ""
//        override func awakeFromNib() {
//            super.awakeFromNib()
//
//            //TODO: Code for our button
//        }
//    }
//}
