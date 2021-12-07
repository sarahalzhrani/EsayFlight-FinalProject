//
//  AskForHelp.swift
//  EsayFlight
//
//  Created by sara al zhrani on 19/04/1443 AH.
//


import UIKit
import FirebaseFirestore
import FirebaseAuth


class profiel : UIViewController,  UINavigationControllerDelegate{
    var blackSquare: UIView!
    let stackView   = UIStackView()
    let stackView2   = UIStackView()
    var users = [information] ()
    
    
    let Button1 : UIButton = {
        $0.backgroundColor = .white
        $0.setTitle(NSLocalizedString("signout", comment: ""), for: .normal)
        $0.setTitleColor(UIColor.systemMint, for: .normal)
        $0.layer.cornerRadius = 22.5
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addTarget(self, action: #selector(signOut), for: .touchUpInside)
        return $0
    }(UIButton())
    
    let changelanguage : UIButton = {
        $0.backgroundColor = .white
        $0.setTitle(NSLocalizedString("changelanguage", comment: ""), for: .normal)
        $0.setTitleColor(UIColor.systemMint, for: .normal)
        $0.layer.cornerRadius = 22.5
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addTarget(self, action: #selector(changeLang), for: .touchUpInside)
        return $0
    }(UIButton())
    
    
    let name: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("Name:", comment: "")
        label.textColor = .black
        label.font = label.font.withSize(25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let helath : UILabel = {
        let label = UILabel()
        label.text =  NSLocalizedString("Health status:", comment: "")
        label.textColor = .black
        label.font = label.font.withSize(25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let flightNumber: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("Flight number:", comment: "")
        label.textColor = .black
        label.font = label.font.withSize(25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let specailNeeds: UILabel = {
        let label = UILabel()
        label.text =  NSLocalizedString("special Needs:", comment: "")
        label.textColor = .black
        label.font = label.font.withSize(25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let name1: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .black
        label.font = label.font.withSize(25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let helath1 : UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .black
        label.font = label.font.withSize(25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let specailNeeds1 : UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .black
        label.font = label.font.withSize(25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    

    let flightNumber1 : UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .black
        label.font = label.font.withSize(25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        blackSquare = UIView(frame: CGRect(x: 0, y: 100, width:view.bounds.width, height: 800))
        blackSquare.backgroundColor = .white
        blackSquare.layer.cornerRadius = 55
        view.addSubview(blackSquare)
        view.backgroundColor = .systemMint
        

        view.addSubview(Button1)
        NSLayoutConstraint.activate([
            Button1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 450),
            Button1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            Button1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            Button1.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        
        view.addSubview(changelanguage)
        NSLayoutConstraint.activate([
            changelanguage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 500),
            changelanguage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            changelanguage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            changelanguage.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        
        
        
        stackView.axis  = NSLayoutConstraint.Axis.vertical
        stackView.distribution  = UIStackView.Distribution.equalSpacing
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing   = 50
        stackView.addArrangedSubview(name)
        stackView.addArrangedSubview(helath)
        stackView.addArrangedSubview(specailNeeds)
        stackView.addArrangedSubview(flightNumber)
        stackView.translatesAutoresizingMaskIntoConstraints = false

        self.view.addSubview(stackView)
        stackView.leftAnchor.constraint(equalTo: self.view.leftAnchor,constant: 16).isActive = true
        stackView.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 200).isActive = true
        
        
        
        stackView2.axis  = NSLayoutConstraint.Axis.vertical
        stackView2.distribution  = UIStackView.Distribution.equalSpacing
        stackView2.alignment = UIStackView.Alignment.center
        stackView2.spacing   = 50
        stackView2.addArrangedSubview(name1)
        stackView2.addArrangedSubview(helath1)
        stackView2.addArrangedSubview(specailNeeds1)
        stackView2.addArrangedSubview(flightNumber1)
        stackView2.translatesAutoresizingMaskIntoConstraints = false

        self.view.addSubview(stackView2)
        stackView2.leftAnchor.constraint(equalTo: self.view.leftAnchor,constant: 180).isActive = true
        stackView2.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 200).isActive = true
        
        
        Firestore.firestore().collection("profile").addSnapshotListener { snapshot, error in
            
            
            if error != nil {
                print(snapshot)
                return
            }
            print(snapshot)
            
            guard let docs = snapshot?.documents else {
                return
            }
            print(docs)
            
            var details : [information] = []
            for doc in docs {
                let data = doc.data()
       
//                    let name = data["name"] as? String,
//                    let specailNeeds = data["specailNeeds"] as? String,
//                    let helath = data["helath"] as? String,
//                    let flightNumber = data["flightNumber"] as? String
//
//
//                else {
//
//                    continue
//                }
               
                print(snapshot)
                    let userdetails = information(
                        name: (data["name"] as? String) ?? "",
                       helath:(data["helath"] as? String) ?? "",
                    specailNeeds: (data["specailNeeds"] as? String) ?? "",
                    flightNumber: (data["flightNumber"] as? String) ?? ""
                                           )
                details.append(userdetails)
                    
                }
                 self.users = details
            }
        
    }
    @objc func signOut() {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            let vc = LoginVC()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        } catch let signOutError as NSError {
            print ("Error signing out: \(signOutError.localizedDescription)")
        }
    }
    
    @objc func changeLang() {
        let currentLang = Locale.current.languageCode
        let newLanguage = currentLang == "en" ? "ar" : "en"
        UserDefaults.standard.setValue([newLanguage], forKey: "AppleLanguages")
        exit(0)

    }
    
}
    
    

        


