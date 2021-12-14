//
//  AskForhelpServices.swift
//  EsayFlight
//
//  Created by sara al zhrani on 03/05/1443 AH.
//

import UIKit
import FirebaseFirestore

class MyFlight {
    static let shared = MyFlight()
    
    let myflightsCollection = Firestore.firestore().collection("myflights")
    
    func addmYflight(flight: Fligt) {
        
        Firestore.firestore().collection("myflights").document(flight.cityName).setData([
            " cityName": flight.cityName,
            "time": flight.time ,
            "date": flight.date,
            "terminal": flight.terminal,
            "flightNum": flight.flightNum,
            "fligtStatuse": flight.fligtStatuse
              ], merge: true)
}
    
    
    func listenToMyFlight(completion: @escaping (([Fligt]) -> Void)) {
        myflightsCollection.addSnapshotListener { snapshot, error in
       if error != nil {
        return
       }
       guard let documents = snapshot?.documents else { return }
       var favorite: Array<Fligt> = []
       for document in documents {
        let data = document.data()
        let trip = Fligt(
            cityName: (data[" cityName"] as? String) ?? "No name",
            time: (data["time"] as? String) ?? "",
            date: (data["date"] as? String) ?? "",
            terminal: (data["terminal"] as? String) ?? "",
            flightNum: (data["flightNum"] as? String) ?? "",
            fligtStatuse: (data["fligtStatuse"] as? String) ?? ""
           
           )

         favorite.append(trip)
       }
       completion(favorite)
      }
     }
    
    
    
    
    
}
