//
//  serchForFlight.swift
//  EsayFlight
//
//  Created by sara al zhrani on 19/04/1443 AH.
//

import UIKit
import FirebaseFirestore
import SPAlert



class serchForFlight : UIViewController,  UINavigationControllerDelegate, UITableViewDelegate, UITableViewDataSource {
    var tables = [Fligt] ()
   

    lazy var tableView2: UITableView = {
        let tablaView = UITableView()
        tablaView.translatesAutoresizingMaskIntoConstraints = false
        tablaView.delegate = self
        tablaView.dataSource = self
        tablaView.register(tableflightCell.self, forCellReuseIdentifier: tableflightCell.identifire)
        tablaView.backgroundColor = UIColor(named: "Color")
        return tablaView
       }()
    
    override func viewDidLoad() {
          super.viewDidLoad()
        view.addSubview(tableView2)
        tableView2.backgroundColor = .systemGray5
        view.backgroundColor = .white
        title = "Flights"
        NSLayoutConstraint.activate([
            
            tableView2.topAnchor.constraint(equalTo: view.topAnchor),
                tableView2.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                tableView2.rightAnchor.constraint(equalTo: view.rightAnchor),
                tableView2.leftAnchor.constraint(equalTo: view.leftAnchor)
            ])
        
        
        
        Firestore.firestore().collection("flights").addSnapshotListener { snapshot, error in
            
            
            if error != nil {
                print(snapshot)
                return
            }
            print(snapshot)
            
            guard let docs = snapshot?.documents else {
                return
            }
            print(docs)
            
            var details : [Fligt] = []
            for doc in docs {
                let data = doc.data()
               
                    let flightdetails = Fligt(
                        cityName: (data["cityName"] as? String) ?? "",
                        time: (data["time"] as? String) ?? "",
                        date: (data["date"] as? String) ?? "",
                        terminal: (data["terminal"] as? String) ?? "",
                        flightNum: (data["flightNum"] as? String ) ?? "",
                        fligtStatuse: (data["fligtStatuse"] as? String) ?? ""
                        
                        
                                           )
                details.append(flightdetails)
                    
                }
                 self.tables = details
                self.tableView2.reloadData()
            
            }
        
      
      
        
        
  
      }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tables.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableflightCell", for: indexPath) as! tableflightCell
        let data = tables[indexPath.row]
        
        cell.gatelabel.text = data.terminal
        cell.status.text = data.fligtStatuse
        cell.fightnumberlabel.text = data.flightNum
        cell.timelabel.text = data.time
        cell.Citylabel.text = data.cityName
        

    
        return cell}
    
    var selectedIndex  = -1
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         if indexPath.row == selectedIndex {
          return 140
         }else {
          return 250
         }
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tables[indexPath.row].isSelcted = true
       
    }
    
}

    class tableflightCell: UITableViewCell {
        static let identifire = "tableflightCell"
        
        
    
        
        let imagecell = UIImageView()
        var line: UIView!
        var view1 = UIView()
        var view2 = UIView()
        
        let Citylabel: UILabel = {
            let label = UILabel()
            label.text = ""
            label.textColor = .black
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
            label.text = "Date Flight:"
            label.textColor = .black
            label.font = label.font.withSize(16)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let statusFlight: UILabel = {
            let label = UILabel()
            label.text = "Flight Statuse:"
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
            label.text = ""
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
            label.text = "To"
            label.textColor = UIColor(red: 47/255, green: 79/255, blue: 79/250, alpha: 2)
            label.font = label.font.withSize(25)
            label.numberOfLines = 0
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let terminalabel: UILabel = {
            let label = UILabel()
            label.text = "Terminal:"
            label.textColor = .black
            label.font = label.font.withSize(16)
            label.numberOfLines = 0
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()

        let gatelabel: UILabel = {
            let label = UILabel()
            label.text = ""
            label.textColor = .gray
            label.font = label.font.withSize(16)
            label.numberOfLines = 0
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        
        let donLable : UIButton = {
            $0.setImage(UIImage(systemName:"plus.circle"), for: .normal)
            $0.setTitleColor(UIColor.white, for: .normal)
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.addTarget(self, action: #selector(aDD), for: .touchUpInside)
            return $0
        }(UIButton())
     

        
        
        
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            contentView.backgroundColor = .white
            view2 = UIView(frame: CGRect(x: 0, y:0, width: 100, height:100))
            view2.backgroundColor = .red
            view2.layer.cornerRadius = 10
            
            view1 = UIView(frame: CGRect(x: 0, y:0, width: 400, height:220))
            view1.backgroundColor = .white
            view1.layer.cornerRadius = 10
            self.addSubview(view1)
//            self.addSubview(view2)
            view1.addSubview(imagecell)
            imagecell.image = UIImage(named: "000")
            imagecell.layer.masksToBounds = true
            imagecell.layer.cornerRadius = 100
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
            view1.addSubview(Citylabel)
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
            NSLayoutConstraint.activate([
                donLable.topAnchor.constraint(equalTo: view1.topAnchor, constant: 200),
                donLable.leadingAnchor.constraint(equalTo: view1.leadingAnchor, constant: 300),
                donLable.trailingAnchor.constraint(equalTo: view1.trailingAnchor, constant: -30),
                donLable.heightAnchor.constraint(equalToConstant: 20),
                donLable.widthAnchor.constraint(equalToConstant: 40)

                
            ])
            
            
            timelabel.centerXAnchor.constraint(equalTo:view1.centerXAnchor).isActive = true
            timelabel.topAnchor.constraint(equalTo: view1.topAnchor,constant: 90).isActive = true
            timelabel.leadingAnchor.constraint(equalTo: view1.leadingAnchor, constant: 220).isActive = true
            timelabel.trailingAnchor.constraint(equalTo:view1.trailingAnchor).isActive = true

            Citylabel.topAnchor.constraint(equalTo: tOlabel.bottomAnchor,constant: 10).isActive = true
            Citylabel.leadingAnchor.constraint(equalTo: view1.leadingAnchor,constant: 90).isActive = true
            Citylabel.trailingAnchor.constraint(equalTo: view1.trailingAnchor,constant: -16).isActive = true

            
            
            
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
//            let alertView = SPAlertView(title: "Added to Library", message: nil, preset: SPAlertIconPreset.done)
//            alertView.duration = 3
//            alertView.present()
//            alertView.layout.margins.top = 12
//            alertView.layout.iconSize = 30
//            alertView.dismissByTap = false

        }
        
        required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
        }

        var tab2: Fligt!
        
        @objc func aDD() {
            SPAlert.present(title: "Added to My Flight", preset: .done)


            
            let Cityname2 = Citylabel.text ?? ""
            let timename = timelabel.text ?? ""
            let datename = dateNumber.text ?? ""
            let terminalname = gatelabel.text ?? ""
            let flightNumname = fightnumberlabel.text ?? ""
            let fligtStatusename = status.text ?? ""
            
            MyFlight.shared.addmYflight(flight: Fligt(cityName: Cityname2, time: timename,
                date: datename,
              terminal: terminalname,
              flightNum: flightNumname,
            fligtStatuse:  fligtStatusename)
            )
    }
       

    }
