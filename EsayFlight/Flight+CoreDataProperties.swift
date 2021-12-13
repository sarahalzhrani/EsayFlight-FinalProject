//
//  Flight+CoreDataProperties.swift
//  EsayFlight
//
//  Created by sara al zhrani on 09/05/1443 AH.
//
//

import Foundation
import CoreData


extension Flight {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Flight> {
        return NSFetchRequest<Flight>(entityName: "Flight")
    }

    @NSManaged public var flightName: String?
    @NSManaged public var flightNumber: String?
    @NSManaged public var flightDate: String?

}

extension Flight : Identifiable {

}
