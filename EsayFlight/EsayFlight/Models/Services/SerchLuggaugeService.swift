//
//  SerchLuggauge.swift
//  EsayFlight
//
//  Created by sara al zhrani on 20/04/1443 AH.
//


import UIKit
import FirebaseFirestore


class SearchService {
    static let shared = SearchService()
    let searchCollection = Firestore.firestore().collection("finde")
    
    func updateOrAddNewSearch(note: Search) {
        searchCollection.document(note.id).setData([
            "id": note.id,
            "content": note.content,
            "flightnumber": note.flightnumber,
            "contactNumber": note.contactNumber
        ], merge: true)
        print(note)
    }
    
    func listenToSearch(completion: @escaping (([Search]) -> Void)) {
        searchCollection.addSnapshotListener { snapshot, error in
            if error != nil {
                return
            }
           
            guard let docs = snapshot?.documents else { return }
            var notes = [Search]()
            
            for doc in docs {
                let data = doc.data()
                print(data)
                guard
                    let id = data["id"] as? String,
                    let content = data["content"] as? String,
                    let flightnumber = data["flightnumber"] as? String,
                        let contactNumber = data["contactNumber"] as? String
                        
                else {
                    continue
                }
                
                notes.append(Search(id: id, content: content, flightnumber: flightnumber, contactNumber: contactNumber))
               
            }
            
            completion(notes)
        }
    }
}

