//
//  Editingprofile.swift
//  EsayFlight
//
//  Created by sara al zhrani on 13/06/1443 AH.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class Editingprofile: UIViewController, UITextFieldDelegate {
    
    
    lazy var contentTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Enter new name "
        tf.delegate = self
        tf.backgroundColor = .white
        tf.textAlignment = .center
        tf.layer.cornerRadius = 12
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.black.cgColor
        return tf
    }()
    
    let details: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("Change your name :", comment: "")
        label.textAlignment = .left
        label.font = label.font.withSize(25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var contentTF2: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Enter your email.."
        tf.delegate = self
        tf.textAlignment = .center
        tf.backgroundColor = .white
        tf.layer.cornerRadius = 12
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.black.cgColor
       
        return tf
    }()
    let flightnumber: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("Change your Email:", comment: "")
        label.textAlignment = .left
        label.font = label.font.withSize(25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    

    
    var saveBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle(NSLocalizedString("Save", comment: ""), for: .normal)
        btn.backgroundColor = .white
        btn.setTitleColor(UIColor.black, for: UIControl.State.normal)
        btn.layer.cornerRadius = 15
        btn.layer.borderColor = UIColor.black.cgColor
        btn.layer.borderWidth = 2
        btn.addTarget(self, action: #selector(saveBtnPressed), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title =  NSLocalizedString("Edit your profile", comment:"")
     
//        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
//        backgroundImage.image = UIImage(named: "abc")
//        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
//        self.view.insertSubview(backgroundImage, at: 0)
        view.backgroundColor = UIColor(red: 116/255, green: 102/255, blue: 145/250, alpha: 2)
        self.contentTF2.delegate = self
        self.contentTF.delegate = self
        view.addSubview(contentTF)
        view.addSubview(details)
        view.addSubview(contentTF2)
        view.addSubview(flightnumber)
        view.addSubview(saveBtn)
        NSLayoutConstraint.activate([
            
            details.topAnchor.constraint(equalTo: view.topAnchor, constant: 190),
            details.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            details.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            details.heightAnchor.constraint(equalToConstant: 40),
            
            contentTF.topAnchor.constraint(equalTo: details.bottomAnchor, constant: 10),
            contentTF.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            contentTF.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            contentTF.heightAnchor.constraint(equalToConstant: 40),
            
           
            flightnumber.topAnchor.constraint(equalTo: contentTF.bottomAnchor, constant: 20),
            flightnumber.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            flightnumber.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            flightnumber.heightAnchor.constraint(equalToConstant: 40),
            
            contentTF2.topAnchor.constraint(equalTo: flightnumber.bottomAnchor, constant: 10),
            contentTF2.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            contentTF2.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            contentTF2.heightAnchor.constraint(equalToConstant: 40),
            
            
            saveBtn.topAnchor.constraint(equalTo: contentTF2.bottomAnchor, constant: 50),
            saveBtn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32),
            saveBtn.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32),
            saveBtn.heightAnchor.constraint(equalToConstant: 40),
            
        ])
        
        
        
        
        
   
    }
    
    @objc func saveBtnPressed(){
        guard let currentUserID = Auth.auth().currentUser?.uid else {return}
        Firestore.firestore().document("users/\(currentUserID)").setData([
            "name" : contentTF.text as Any,
            "id" : currentUserID,
            "email" :contentTF2.text as Any,
        ],merge: true)
        let alert1 = UIAlertController(
            title: ("Saved"),
            message: "Saved update data",
            preferredStyle: .alert)
        alert1.addAction(
            UIAlertAction(
                title: "OK",
                style: .default,
                handler: { action in
                    print("OK")
                }
            )
        )
        present(alert1, animated: true, completion: nil)
      
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField){
        contentTF.resignFirstResponder()
        contentTF2.resignFirstResponder()
       
    }
}
