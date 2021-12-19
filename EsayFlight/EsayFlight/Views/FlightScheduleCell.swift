//
//  FlightScheduleCell.swift
//  EsayFlight
//
//  Created by sara al zhrani on 06/05/1443 AH.
//

import UIKit
import FirebaseFirestore
import SPAlert

class FlightScheduleCell: UICollectionViewCell {

    static let identifier = "FlightScheduleCell"
    
    
    let imagecell = UIImageView()
    var line: UIView!
    var view1 = UIView()
    
    let nameCitylabel: UILabel = {
        let label = UILabel()
//        label.text = "dd"
        label.textColor = .red
        label.backgroundColor = .yellow
        label.font = label.font.withSize(16)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let timelabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .black
        label.font = label.font.withSize(16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dateFlight: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("Date Flight:", comment:"")
        label.textColor = .black
        label.font = label.font.withSize(16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let statusFlight: UILabel = {
        let label = UILabel()
        label.text =  NSLocalizedString("Flight Statuse:", comment:"")
        label.textColor = .black
        label.font = label.font.withSize(16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let status: UILabel = {
        let label = UILabel()
        label.text = "On time"
        label.textColor = .gray
        label.font = label.font.withSize(16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dateNumber: UILabel = {
        let label = UILabel()
        label.text = "9-septamprt"
        label.textColor = .gray
        label.font = label.font.withSize(16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let fightnumberlabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .gray
        label.font = label.font.withSize(16)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let image1: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "air")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let image2: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "clock")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let tOlabel: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("To", comment:"")
        label.textColor = UIColor(red: 47/255, green: 79/255, blue: 79/250, alpha: 2)
        label.font = label.font.withSize(25)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let terminalabel: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("Gate:", comment:"")
        label.textColor = .black
        label.font = label.font.withSize(16)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let gatelabel: UILabel = {
        let label = UILabel()
        label.text = "5"
        label.textColor = .gray
        label.font = label.font.withSize(16)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let donLable : UIButton = {
//        $0.setTitle(NSLocalizedString("Done", comment: ""), for: .normal)
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.setImage(UIImage(systemName: "checkmark"), for: .normal)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addTarget(self, action: #selector(doNE), for: .touchUpInside)
        return $0
    }(UIButton())
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
 
    func saveData(number:String, name:String, date1: String){
        let newItems = Flight(context: context)
        newItems.flightNumber = number
        newItems.flightName = name
        newItems.flightDate = date1
        do {
            try context.save()
        }
        catch{
            
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        view1 = UIView(frame: CGRect(x: 0, y:0, width: self.frame.width, height:250))
        view1.backgroundColor = .white
        view1.layer.cornerRadius = 10
        contentView.addSubview(view1)
        view1.addSubview(imagecell)
        imagecell.image = UIImage(named: "air2")
        imagecell.layer.masksToBounds = true
//        imagecell.layer.cornerRadius = 100
        imagecell.contentMode = .scaleAspectFit

           NSLayoutConstraint.activate([imagecell.leftAnchor.constraint(equalTo: leftAnchor),
           imagecell.topAnchor.constraint(equalTo: view1.topAnchor, constant: 20),
           imagecell.heightAnchor.constraint(equalToConstant: 80),
           imagecell.widthAnchor.constraint(equalTo: imagecell.heightAnchor,multiplier: 100/100)])
           imagecell.translatesAutoresizingMaskIntoConstraints = false

        line = UIView(frame: CGRect(x: 30, y: 120, width: 350, height:1))
        line.backgroundColor = .gray
        line.layer.cornerRadius = 10
        view1.addSubview(line)
     
        self.backgroundColor = .clear
        view1.addSubview(timelabel)
        
        view1.addSubview(dateFlight)
        view1.addSubview(dateNumber)
        view1.addSubview(fightnumberlabel)
        view1.addSubview(statusFlight)
        view1.addSubview(image1)
        view1.addSubview(image2)
        view1.addSubview(tOlabel)
        view1.addSubview(status)
        view1.addSubview(terminalabel)
        view1.addSubview(gatelabel)
        view1.addSubview(donLable)
        view1.addSubview(nameCitylabel)
        NSLayoutConstraint.activate([
            donLable.topAnchor.constraint(equalTo: view1.topAnchor, constant: 200),
            donLable.leadingAnchor.constraint(equalTo: view1.leadingAnchor, constant: 300),
            donLable.trailingAnchor.constraint(equalTo: view1.trailingAnchor, constant: -30),
            donLable.heightAnchor.constraint(equalToConstant: 20),
            donLable.widthAnchor.constraint(equalToConstant: 20)

            
        ])
        
        
        timelabel.centerXAnchor.constraint(equalTo:view1.centerXAnchor).isActive = true
        timelabel.topAnchor.constraint(equalTo: view1.topAnchor,constant: 90).isActive = true
        timelabel.leadingAnchor.constraint(equalTo: view1.leadingAnchor, constant: 220).isActive = true
        timelabel.trailingAnchor.constraint(equalTo:view1.trailingAnchor).isActive = true

        nameCitylabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 50).isActive = true
        nameCitylabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 90).isActive = true
//        nameCitylabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        nameCitylabel.widthAnchor.constraint(equalToConstant: 100).isActive = true

        nameCitylabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
//        Citylabel.trailingAnchor.constraint(equalTo: view1.trailingAnchor).isActive = true

        
        
        
        dateFlight.centerXAnchor.constraint(equalTo:view1.centerXAnchor).isActive = true
        dateFlight.topAnchor.constraint(equalTo: view1.topAnchor,constant: 140).isActive = true
        dateFlight.leadingAnchor.constraint(equalTo: view1.leadingAnchor, constant: 16).isActive = true
        dateFlight.trailingAnchor.constraint(equalTo:view1.trailingAnchor).isActive = true
        
        statusFlight.centerXAnchor.constraint(equalTo:view1.centerXAnchor).isActive = true
        statusFlight.topAnchor.constraint(equalTo: view1.topAnchor,constant: 200).isActive = true
        statusFlight.leadingAnchor.constraint(equalTo: view1.leadingAnchor, constant: 16).isActive = true
        statusFlight.trailingAnchor.constraint(equalTo:view1.trailingAnchor).isActive = true
        
        
        status.centerXAnchor.constraint(equalTo:view1.centerXAnchor).isActive = true
        status.topAnchor.constraint(equalTo: view1.topAnchor,constant: 200).isActive = true
        status.leadingAnchor.constraint(equalTo: view1.leadingAnchor, constant: 140).isActive = true
        status.trailingAnchor.constraint(equalTo:view1.trailingAnchor).isActive = true
        
        dateNumber.centerXAnchor.constraint(equalTo:view1.centerXAnchor).isActive = true
        dateNumber.topAnchor.constraint(equalTo: view1.topAnchor,constant: 170).isActive = true
        dateNumber.leadingAnchor.constraint(equalTo: view1.leadingAnchor, constant: 16).isActive = true
        dateNumber.trailingAnchor.constraint(equalTo:view1.trailingAnchor).isActive = true
        
        fightnumberlabel.centerXAnchor.constraint(equalTo: view1.centerXAnchor).isActive = true
        fightnumberlabel.topAnchor.constraint(equalTo:  view1.topAnchor,constant: 90).isActive = true
        fightnumberlabel.leadingAnchor.constraint(equalTo: view1.leadingAnchor, constant: 110).isActive = true
        fightnumberlabel.trailingAnchor.constraint(equalTo:view1.trailingAnchor).isActive = true
                
        
        
        image1.topAnchor.constraint(equalTo: view1.topAnchor,constant: 90).isActive = true
        image1.leftAnchor.constraint(equalTo: view1.leftAnchor,constant: 85).isActive = true
        image1.heightAnchor.constraint(equalToConstant: 15).isActive = true
        image1.widthAnchor.constraint(equalToConstant: 15).isActive = true
        
        image2.topAnchor.constraint(equalTo: view1.topAnchor,constant: 90).isActive = true
        image2.leftAnchor.constraint(equalTo: view1.leftAnchor,constant: 200).isActive = true
        image2.heightAnchor.constraint(equalToConstant: 15).isActive = true
        image2.widthAnchor.constraint(equalToConstant: 15).isActive = true
        
        tOlabel.centerXAnchor.constraint(equalTo: view1.centerXAnchor).isActive = true
        tOlabel.topAnchor.constraint(equalTo:  view1.topAnchor,constant: 15).isActive = true
        tOlabel.leadingAnchor.constraint(equalTo: view1.leadingAnchor, constant:90).isActive = true
        tOlabel.trailingAnchor.constraint(equalTo:view1.trailingAnchor).isActive = true
        
        terminalabel.centerXAnchor.constraint(equalTo:view1.centerXAnchor).isActive = true
        terminalabel.topAnchor.constraint(equalTo: view1.topAnchor,constant: 140).isActive = true
        terminalabel.leadingAnchor.constraint(equalTo: view1.leadingAnchor, constant: 250).isActive = true
        terminalabel.trailingAnchor.constraint(equalTo:view1.trailingAnchor).isActive = true
        
        gatelabel.centerXAnchor.constraint(equalTo:view1.centerXAnchor).isActive = true
        gatelabel.topAnchor.constraint(equalTo: view1.topAnchor,constant: 170).isActive = true
        gatelabel.leadingAnchor.constraint(equalTo: view1.leadingAnchor, constant: 260).isActive = true
        gatelabel.trailingAnchor.constraint(equalTo:view1.trailingAnchor).isActive = true
        
        self.layer.cornerRadius = 25.0
        self.layer.borderWidth = 25
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.masksToBounds = true

        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.layer.shadowRadius = 2
        self.layer.shadowOpacity = 0.2
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath
        
       
        
    }
    
    
    @objc func doNE() {
        let Cityname2 = nameCitylabel.text ?? ""
        
        SPAlert.present(message: "Thank God for safety We wish you a pleasant stay", haptic: .none)
        
        Firestore.firestore().collection("myflights").document(Cityname2).delete { err in
            if let error = err {
                print("NO Delete with error \(error)")
            } else {
                print("item deleted from collection \(Cityname2)")
            }
        }
        
        let x1 = nameCitylabel.text ?? ""
        let x2 = fightnumberlabel.text ?? ""
        let x3 = timelabel.text ?? ""
        saveData(number: x2, name: x1, date1: x3)


    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
}

