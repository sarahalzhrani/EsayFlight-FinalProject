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
               Homme (image: UIImage(named: "services")!, name: NSLocalizedString("Services", comment: "")),
               Homme (image: UIImage(named: "luggage")!, name: NSLocalizedString("lost luggage", comment: ""))
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
    Term1(image: UIImage(named: "1")!, name: "Macdonldas"),
    Term1(image: UIImage(named: "2")!, name: "Albaik"),
    Term1(image: UIImage(named: "3")!, name: "Dankin Dounts"),
    Term1(image: UIImage(named: "4")!, name: "Starbucks"),
    Term1(image: UIImage(named: "5")!, name: "pizzHut"),
    Term1(image: UIImage(named: "6")!, name: "Fridays"),
    Term1(image: UIImage(named: "7")!, name: "information"),
    Term1(image: UIImage(named: "8")!, name: "subWay"),
               
]

// for terminal2 collectionview

struct Term2 {
    var image1: UIImage
    var name1 : String
}
var array2 = [
    Term2(image1: UIImage(named: "a")!, name1: "Movenpick"),
    Term2(image1: UIImage(named: "b")!, name1: "bean"),
    Term2(image1: UIImage(named: "c")!, name1: "simit Saray"),
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
    Cars(image2: UIImage(named: "budget")!, name2: "budget"),
    Cars(image2: UIImage(named: "AVIS")!, name2: "AVIS"),
    Cars(image2: UIImage(named: "Hanco")!, name2: "Hanco"),
    Cars(image2: UIImage(named: "Hertz-Logo")!, name2: "Hertz"),
    Cars(image2: UIImage(named: "Key")!, name2: "Key"),
    Cars(image2: UIImage(named: "YELO")!, name2: "YELO"),
]

