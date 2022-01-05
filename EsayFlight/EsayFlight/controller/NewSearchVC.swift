//
//  NewSearchVC.swift
//  EsayFlight
//
//  Created by sara al zhrani on 20/04/1443 AH.
//

import UIKit

class NewSearchVC: UIViewController, UITextFieldDelegate {
    
    var data: Search?
    
    lazy var contentTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Add details.."
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
        label.text = NSLocalizedString("Enter your lagguage details :", comment: "")
        label.textAlignment = .left
        label.font = label.font.withSize(25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var contentTF2: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Add your Flight Number.."
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
        label.text = NSLocalizedString("Enter your flight number :", comment: "")
        label.textAlignment = .left
        label.font = label.font.withSize(25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    lazy var contentTF3: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Add your Phone Number.."
        tf.delegate = self
        tf.textAlignment = .center
        tf.backgroundColor = .white
        tf.layer.cornerRadius = 12
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.black.cgColor
        return tf
    }()
    
    let number: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("Enter your Phone number :", comment: "")
        label.textAlignment = .left
        label.numberOfLines = 0
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
        
        title =  NSLocalizedString("Edit your searching", comment:"")
     
//        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
//        backgroundImage.image = UIImage(named: "abc")
//        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
//        self.view.insertSubview(backgroundImage, at: 0)
        view.backgroundColor = .gray
        
        view.addSubview(contentTF)
        view.addSubview(details)
        view.addSubview(contentTF2)
        view.addSubview(flightnumber)
        view.addSubview(contentTF3)
        view.addSubview(number)
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
            
            number.topAnchor.constraint(equalTo: contentTF2.bottomAnchor, constant: 20),
            number.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            number.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            number.heightAnchor.constraint(equalToConstant: 40),
            
            contentTF3.topAnchor.constraint(equalTo: number.bottomAnchor, constant: 10),
            contentTF3.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            contentTF3.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            contentTF3.heightAnchor.constraint(equalToConstant: 40),
            
            
            saveBtn.topAnchor.constraint(equalTo: contentTF3.bottomAnchor, constant: 50),
            saveBtn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32),
            saveBtn.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32),
            saveBtn.heightAnchor.constraint(equalToConstant: 40),
            
        ])
        
        
        
        
        
        contentTF.text = data?.content
        contentTF2.text = data?.flightnumber
        contentTF3.text = data?.contactNumber
    }
    
    @objc func saveBtnPressed() -> Bool {
        data?.content = contentTF.text ?? ""
        data?.flightnumber = contentTF2.text ?? ""
        data?.contactNumber = contentTF3.text ?? ""
        
        guard let note = data else { return true }
        SearchService.shared.updateOrAddNewSearch(note: note)
        return true
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField){
        contentTF.resignFirstResponder()
    
        contentTF2.resignFirstResponder()
        contentTF3.resignFirstResponder()
       
    }
}
