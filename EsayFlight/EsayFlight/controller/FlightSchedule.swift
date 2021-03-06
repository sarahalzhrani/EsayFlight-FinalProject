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
    var isSelcted: Bool = false
   
}

var dat22 = [Fligt(cityName: "makah", time: "9", date: "2-15", terminal: "5", flightNum: "fd555", fligtStatuse: "onTime")]


class FlightSchedule : UIViewController, UICollectionViewDelegateFlowLayout, UINavigationControllerDelegate {
    var item: [Flight] = [] 
    
    var flightSchedule1 = [Fligt(cityName: "Abha", time: "4: 00", date: "9 - septmper", terminal: "1", flightNum: "ET3416", fligtStatuse: "on time", isSelcted: false)]
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    var FlightcollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing =  12
        layout.sectionInset = .zero
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.alwaysBounceVertical = true
        return cv
    }()
    
    let mylastFlightlabel: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("Logs Flights:", comment:"")
        label.font = label.font.withSize(30)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let logscollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing =  12
        layout.sectionInset = .zero
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.alwaysBounceVertical = true
        return cv
    }()
    
    let imageViewbackground : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named:"background2")
        iv.contentMode = .scaleAspectFill
        return iv
    }()
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        fitchData()
//
//
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 116/255, green: 102/255, blue: 145/250, alpha: 2)
        view.addSubview(FlightcollectionView)
        view.addSubview(logscollectionView)
        view.addSubview(mylastFlightlabel)
        fitchData()
//        logscollectionView.reloadData()
        logscollectionView.reloadData()
        title = NSLocalizedString("My Flight", comment:"")
        
        setupCollectionView()
        setupCollectionView2()
        FlightcollectionView.backgroundView = imageViewbackground
        FlightcollectionView.dataSource = self
        FlightcollectionView.delegate = self
        FlightcollectionView.showsVerticalScrollIndicator = false
        FlightcollectionView.register(FlightScheduleCell.self, forCellWithReuseIdentifier: FlightScheduleCell.identifier)
        
        logscollectionView.dataSource = self
        logscollectionView.delegate = self
        logscollectionView.backgroundColor = .systemGray6
        logscollectionView.showsVerticalScrollIndicator = false
        logscollectionView.register(LOgCEllCell.self, forCellWithReuseIdentifier: LOgCEllCell.identifier)
        MyFlight.shared.listenToMyFlight { newData in
            self.flightSchedule1 = newData
            self.FlightcollectionView.reloadData()
        }
        self.navigationItem.hidesBackButton = true
        self.navigationItem.hidesBackButton = true
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 60, width: view.frame.size.width, height: 60))
        view.addSubview(navBar)
        let navItem = UINavigationItem(title: "My flights")
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: NSLocalizedString("Home", comment: ""), style: .plain, target: self, action: #selector(handleCancel))
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(openNewPage)
        )
        mylastFlightlabel.topAnchor.constraint(equalTo:FlightcollectionView.bottomAnchor,constant: 20).isActive = true
        mylastFlightlabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16).isActive = true
        mylastFlightlabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -16).isActive = true
    }
    func setupCollectionView() {
        FlightcollectionView.translatesAutoresizingMaskIntoConstraints = false
        FlightcollectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        FlightcollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -300).isActive = true
        FlightcollectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        FlightcollectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    func setupCollectionView2() {
        logscollectionView.translatesAutoresizingMaskIntoConstraints = false
        logscollectionView.topAnchor.constraint(equalTo: mylastFlightlabel.bottomAnchor,constant: 5).isActive = true
        logscollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
        logscollectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        logscollectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    /// save data to core date
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
    /// get data form Corr date
    func fitchData(){
        do {
            let item = try context.fetch(Flight.fetchRequest())
            self.item = item
            self.logscollectionView.reloadData()
        }
        catch{
            
        }
    }
    @objc func handleCancel() {
        dismiss(animated: true, completion: nil)
    }
    @objc func openNewPage() {
        let alert = UIAlertController(title: "", message: "", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: NSLocalizedString("Add Flight", comment:""), style: .default, handler: { Action in
            let view = UINavigationController(rootViewController: serchForFlight())
            self.present(view, animated: true, completion: nil)
            
        } ))
        alert.addAction(UIAlertAction(title: NSLocalizedString("Scan parcod", comment:"") , style: .default, handler: { Action in
            self.present(ScanCode(), animated: true, completion: nil)
            
        }))
        alert.addAction(UIAlertAction(title: NSLocalizedString("cancel", comment:""), style: .destructive, handler: nil))
        present(alert, animated: true, completion: nil)
        
    }
    @objc func closeit() {
        dismiss(animated: true, completion: nil)
    }
}
// MARK: Collection View

extension FlightSchedule: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView === self.logscollectionView{
            return item.count
        } else {
            return flightSchedule1.count
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (collectionView === logscollectionView){
            let cell2 = logscollectionView.dequeueReusableCell(withReuseIdentifier: LOgCEllCell.identifier, for: indexPath) as! LOgCEllCell
            let data2 = item[indexPath.row]
            cell2.CitylabelA.text = data2.flightName
            cell2.timelabelA.text = data2.flightDate
            cell2.fightnumberlabelA.text = data2.flightNumber
            cell2.backgroundColor = .white
            cell2.layer.cornerRadius = 10
            cell2.layer.borderWidth = 25
            cell2.layer.borderColor = UIColor.clear.cgColor
            cell2.layer.masksToBounds = true
            cell2.layer.shadowColor = UIColor.lightGray.cgColor
            cell2.layer.shadowOffset = CGSize(width: 0, height: 2.0)
            cell2.layer.shadowRadius = 7
            cell2.layer.shadowOpacity = 0.5
            cell2.layer.masksToBounds = false
           
            return cell2
        } else  {
            let cell = FlightcollectionView.dequeueReusableCell(withReuseIdentifier: FlightScheduleCell.identifier, for: indexPath) as! FlightScheduleCell
            let data = flightSchedule1[indexPath.row]
            cell.nameCitylabel.text = data.cityName
            cell.timelabel.text = data.time
            cell.fightnumberlabel.text = data.flightNum
            cell.dateNumber.text = data.date
            cell.status.text = data.fligtStatuse
            cell.gatelabel.text = data.terminal
            cell.didfinshadddata = {
                self.fitchData()
                
            }
//            cell.donLable.tag = indexPath.row
//            cell.donLable.addTarget(self, action: #selector(doNE), for: .valueChanged)
            
            return cell
        }
        
    }
    
    
//    @objc func doNE() {
//        logscollectionView.reloadData()
//
//    }
//    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
//        _ = flightSchedule1[indexPath.row]
//    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == self.logscollectionView{
            
            return CGSize(width: view.frame.width, height: 120)
        }
        
        return CGSize(width: view.frame.width, height: 250)
    }
    
}

