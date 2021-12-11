//
//  serchForFlight.swift
//  EsayFlight
//
//  Created by sara al zhrani on 19/04/1443 AH.
//

import UIKit


class serchForFlight : UIViewController,  UINavigationControllerDelegate, UITableViewDelegate, UITableViewDataSource {
    
    
    
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
        tableView2.backgroundColor = .red
        view.backgroundColor = .white
        NSLayoutConstraint.activate([
            
            tableView2.topAnchor.constraint(equalTo: view.topAnchor),
                tableView2.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                tableView2.rightAnchor.constraint(equalTo: view.rightAnchor),
                tableView2.leftAnchor.constraint(equalTo: view.leftAnchor)
            ])
  
      }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableflightCell", for: indexPath) as! tableflightCell
        
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
        
        var isSelcted = false
    }
    
}

    class tableflightCell: UITableViewCell {
        static let identifire = "tableflightCell"
        
        
        
        
        let imagecell = UIImageView()
        var line: UIView!
        var view1 = UIView()
        
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
            label.text = "5"
            label.textColor = .gray
            label.font = label.font.withSize(16)
            label.numberOfLines = 0
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        
        let donLable : UIButton = {
    //        $0.backgroundColor = .white
            $0.setTitle(NSLocalizedString("Done", comment: ""), for: .normal)
            $0.setTitleColor(UIColor.white, for: .normal)
    //        $0.layer.cornerRadius = 22.5
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.addTarget(self, action: #selector(aDD), for: .touchUpInside)
            return $0
        }(UIButton())
     

        
        
        
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            contentView.backgroundColor = .yellow
            view1 = UIView(frame: CGRect(x: 0, y:0, width: self.frame.width, height:250))
            view1.backgroundColor = .gray
            view1.layer.cornerRadius = 10
            self.addSubview(view1)
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
            line.backgroundColor = .white
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
                donLable.widthAnchor.constraint(equalToConstant: 20)

                
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
            
            
        }
        
        required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
        }
        
        
        @objc func aDD() {
        

        }
        
    }
       


//
//class serchForFlight : UIViewController, UITextFieldDelegate {
//
//    var blackSquare: UIView!
//    var allTrips:[Trip] = [.init(id: "12345", gate: "10", time: 5 ),.init(id: "54321", gate: "4", time: 1)]
//
//    let namelable: UILabel = {
//        let label = UILabel()
//        label.text = "Enter your Flight number:"
//        label.textColor = .black
//        label.font = label.font.withSize(25)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//
//    var ticktNumber: UITextField = {
//        let tf = UITextField()
//        tf.translatesAutoresizingMaskIntoConstraints = false
//        tf.backgroundColor = .systemGray6
//        tf.layer.cornerRadius = 15
//        tf.layer.borderColor = UIColor.systemMint.cgColor
//        tf.textAlignment = .center
//        tf.returnKeyType = .continue
//        tf.layer.borderWidth = 2
//        tf.text = ""
//
//        return tf
//    }()
//
//    let depaturelable: UILabel = {
//        let label = UILabel()
//        label.text = "Departure Time :"
//        label.textColor = .black
//        label.font = label.font.withSize(25)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//
//    let Gatelable: UILabel = {
//        let label = UILabel()
//        label.text = "Gate:"
//        label.textColor = .black
//        label.font = label.font.withSize(25)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//
//    let emptay : UILabel = {
//        let label = UILabel()
//        label.text = ""
//        label.textColor = .black
//        label.font = label.font.withSize(16)
//        label.backgroundColor = .systemGray6
//        label.textAlignment = .center
//        label.layer.cornerRadius = 10
//        label.layer.borderWidth = 2
//        label.layer.borderColor = UIColor.systemMint.cgColor
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//
//    let emptay2 : UILabel = {
//        let label = UILabel()
//        label.text = ""
//        label.textColor = .black
//        label.font = label.font.withSize(16)
//        label.backgroundColor = .systemGray6
//        label.textAlignment = .center
//        label.layer.cornerRadius = 10
//        label.layer.borderWidth = 2
//        label.layer.borderColor = UIColor.systemMint.cgColor
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//
//    var imageView: UIImageView = {
//      let imageView = UIImageView()
//      imageView.image = UIImage(named: "airport")
//      imageView.translatesAutoresizingMaskIntoConstraints = false
//      return imageView
//    }()
//
//    lazy var progressView: UIProgressView = {
//        let progressView = UIProgressView(progressViewStyle: .default)
//        progressView.translatesAutoresizingMaskIntoConstraints = false
//        progressView.trackTintColor = .lightGray
//        progressView.progressTintColor = .systemMint
//        progressView.progress =  0.0
//        self.perform(#selector(updateProgress), with: nil, afterDelay: 0.2)
//
//        return progressView
//    }()
//
//    var progressValue = 0.0
//
//    @objc func updateProgress() {
//           progressValue = progressValue + 0.01
//           self.progressView.progress = Float(progressValue)
//           if progressValue != 1.0 {
//               self.perform(#selector(updateProgress), with: nil, afterDelay: 0.2)
//           }
//    }
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        SetupView()
//        ticktNumber.delegate = self
//
//
//    }
//
//
//      private func SetupView () {
//        self.navigationItem.hidesBackButton = true
//        view.backgroundColor = .systemMint
//        navigationItem.leftBarButtonItem = UIBarButtonItem(title: NSLocalizedString("Back", comment: ""), style: .plain, target: self, action: #selector(handleCancel))
//          navigationItem.rightBarButtonItem = UIBarButtonItem(title: NSLocalizedString("✚", comment: ""), style: .plain, target: self, action: #selector(openNewPage))
//
//
//        blackSquare = UIView(frame: CGRect(x: 0, y: 100, width: view.bounds.width, height: 800))
//        blackSquare.backgroundColor = .white
//        blackSquare.layer.cornerRadius = 55
//        view.addSubview(blackSquare)
//        view.addSubview(namelable)
//        view.addSubview(ticktNumber)
//        view.addSubview(depaturelable)
//        view.addSubview(Gatelable)
//        view.addSubview(emptay)
//        view.addSubview(emptay2)
//        view.addSubview(progressView)
//        view.addSubview(imageView)
//        progressView.heightAnchor.constraint(equalToConstant: 12).isActive = true
//        progressView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//        progressView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50).isActive = true
//        progressView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50).isActive = true
//        namelable.topAnchor.constraint(equalTo: view.topAnchor, constant: 170).isActive = true
//        namelable.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
//        namelable.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
//        ticktNumber.topAnchor.constraint(equalTo: namelable.bottomAnchor, constant: 24).isActive = true
//        ticktNumber.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32).isActive = true
//        ticktNumber.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32).isActive = true
//        ticktNumber.heightAnchor.constraint(equalToConstant: 40).isActive = true
//        depaturelable.topAnchor.constraint(equalTo: view.topAnchor, constant: 290).isActive = true
//        depaturelable.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
//        depaturelable.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
//        Gatelable.topAnchor.constraint(equalTo: view.topAnchor, constant: 290).isActive = true
//        Gatelable.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 280).isActive = true
//        Gatelable.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
//        emptay.topAnchor.constraint(equalTo: depaturelable.topAnchor, constant: 50).isActive = true
//        emptay.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
//        emptay.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -250).isActive = true
//        emptay.heightAnchor.constraint(equalToConstant: 40).isActive = true
//        emptay2.topAnchor.constraint(equalTo: Gatelable.topAnchor, constant: 50).isActive = true
//        emptay2.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 280).isActive = true
//        emptay2.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
//        emptay2.heightAnchor.constraint(equalToConstant: 40).isActive = true
//        imageView.topAnchor.constraint(equalTo: view.topAnchor,constant: 385).isActive = true
//        imageView.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 330).isActive = true
//        imageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
//        imageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
//    }
//
//      @objc func handleCancel() {
//        dismiss(animated: true, completion: nil)
//    }
//
//    @objc func openNewPage() {
//      dismiss(animated: true, completion: nil)
//  }
//
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        // done
//        let text = textField.text
//        print(text)
//       let new = allTrips.first(where: {$0.id == text})
//        emptay2.text = new?.gate
//        emptay.text = "\(new?.time ?? 00 )"
//    }
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        // start
//
//
//    }
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//        return true
//    }
//
//
//
//
//    private func setupcolor(){
//        let color1 = GradientView(self)
//    }
//
//
//}
