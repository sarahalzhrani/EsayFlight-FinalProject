//
//  HomeStructs.swift
//  EsayFlight
//
//  Created by sara al zhrani on 18/04/1443 AH.
//

import UIKit


// home collectionView
struct Homme {
 var image: UIImage
 var name: String
}
 
var details = [
               Homme (image: UIImage(named: "air")!, name: NSLocalizedString("Flight", comment: "")),
               Homme (image: UIImage(named: "information")!, name: NSLocalizedString("Ask for help", comment: "")),
               Homme (image: UIImage(named: "icons8-headphones_filled")!, name: NSLocalizedString("Services", comment: "")),
               Homme (image: UIImage(named: "icons8-passenger_with_baggage")!, name: NSLocalizedString("lost luggage", comment: ""))
                ]
// home collectionView2

struct App {
    var photo3 : UIImage
}
var array4 = [App(photo3:  UIImage(named: "trip")!),
              App(photo3:  UIImage(named: "Tasnem")!),
               App(photo3:  UIImage(named: "Maram")!),
               App(photo3:  UIImage(named: "000")!),
]


//serch view
let searchArray = [12234,  12234, 87655, 8997]


struct Search {
    let id: String
    var content: String
    var flightnumber: String
    var contactNumber: String
}


// for terminal2 collectionview

struct Term1 {
    var image: UIImage
    var name : String
}
var array1 = [
    Term1(image: UIImage(named: "1")!, name: NSLocalizedString("Macdonldas", comment: "")),
    Term1(image: UIImage(named: "2")!, name: NSLocalizedString("Albaik", comment: "")),
    Term1(image: UIImage(named: "3")!, name: NSLocalizedString("Dankin Dounts", comment: "") ),
    Term1(image: UIImage(named: "4")!, name: NSLocalizedString("Starbucks", comment: "")),
    Term1(image: UIImage(named: "5")!, name: NSLocalizedString("pizzHut", comment: "")),
    Term1(image: UIImage(named: "6")!, name: NSLocalizedString("Fridays", comment: "")),
    Term1(image: UIImage(named: "7")!, name: NSLocalizedString("information", comment: "") ),
    Term1(image: UIImage(named: "8")!, name: NSLocalizedString("subWay", comment: "") ),
               
]

// for terminal2 collectionview

struct Term2 {
    var image1: UIImage
    var name1 : String
}
var array2 = [
    Term2(image1: UIImage(named: "a")!, name1: NSLocalizedString("Movenpick", comment: "")),
    Term2(image1: UIImage(named: "b")!, name1: NSLocalizedString("bean", comment: "")),
    Term2(image1: UIImage(named: "c")!, name1: NSLocalizedString("simit Saray", comment: "")),
]



// for ask for help controller
struct information {
   var name:  String
    var  helath: String
    var specailNeeds: String
    var flightNumber: String
}
//for car rent controller


struct Cars {
    var image2: UIImage
    var name2 : String
}
var array3 = [
    Cars(image2: UIImage(named: "budget")!, name2: NSLocalizedString("budget", comment: "")),
    Cars(image2: UIImage(named: "AVIS")!, name2: NSLocalizedString("AVIS", comment: "")),
    Cars(image2: UIImage(named: "Hanco")!, name2: NSLocalizedString("Hanco", comment: "")),
    Cars(image2: UIImage(named: "Hertz-Logo")!, name2: NSLocalizedString("Hertz", comment: "") ),
    Cars(image2: UIImage(named: "Key")!, name2:  NSLocalizedString("Key", comment: "")),
    Cars(image2: UIImage(named: "YELO")!, name2: NSLocalizedString("YELO", comment: "")),
]

