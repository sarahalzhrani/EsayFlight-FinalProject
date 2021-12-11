//
//  FlightSchedule.swift
//  EsayFlight
//
//  Created by sara al zhrani on 06/05/1443 AH.
//

import UIKit


struct Fligt {
    var cityName : String
    var time: String
    var date: String
    var terminal : String
    var flightNum: String
    var fligtStatuse: String
   
}


class FlightSchedule : UIViewController {
   var item: [Flight] = []
    
    var flightSchedule1 = [Fligt(cityName: "Abha", time: "4: 00", date: "9 - septmper", terminal: "1", flightNum: "ET3416", fligtStatuse: "on time")]
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    
    var FlightcollectionView: UICollectionView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveData(number: "", name: "")
        self.navigationItem.hidesBackButton = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: NSLocalizedString("close", comment: ""), style: .plain, target: self, action: #selector(closeit))
        
        setupCollectionView()
        _ = UINavigationItem(title: "Flights")
      
    }
    
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: view.frame.width, height: 250)
        FlightcollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        FlightcollectionView.dataSource = self
        FlightcollectionView.delegate = self
        FlightcollectionView.backgroundColor = .systemMint
        FlightcollectionView.showsVerticalScrollIndicator = false
        FlightcollectionView.register(FlightScheduleCell.self, forCellWithReuseIdentifier: FlightScheduleCell.identifier)
        self.view.addSubview(FlightcollectionView)

    }
    
    func saveData(number:String, name:String){
        let newItems = Flight(context: context)
        newItems.flightNumber = number
        newItems.flightName = name
        do {
            try context.save()
        }
        catch{
            
        }
    }
    
    func fitchData(){
        do {
            let item = try context.fetch(Flight.fetchRequest())
            self.item = item
            
        }
        catch{
            
        }
    }
    
}

extension FlightSchedule: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return flightSchedule1.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FlightScheduleCell.identifier, for: indexPath) as! FlightScheduleCell
        let data = flightSchedule1[indexPath.row]
        cell.Citylabel.text = data.cityName
        cell.timelabel.text = data.time
        cell.fightnumberlabel.text = data.flightNum
        
  
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        let data2 = flightSchedule1[indexPath.row]
    
        

    }
    
    @objc func closeit() {
        dismiss(animated: true, completion: nil)
    }
}

