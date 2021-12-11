//
//  Flight+CoreDataProperties.swift
//  EsayFlight
//
//  Created by sara al zhrani on 07/05/1443 AH.
//
//

import Foundation
import CoreData


extension Flight {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Flight> {
        return NSFetchRequest<Flight>(entityName: "Flight")
    }

    @NSManaged public var flightNumber: String?
    @NSManaged public var flightName: String?

}

extension Flight : Identifiable {

}
