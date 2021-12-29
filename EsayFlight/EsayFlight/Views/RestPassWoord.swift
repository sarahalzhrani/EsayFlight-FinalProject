//
//  RestPassWoord.swift
//  EsayFlight
//
//  Created by sara al zhrani on 23/05/1443 AH.
//

import UIKit
import FirebaseAuth
import SPAlert


class RestPassWoord : UIViewController {
    
    let name: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("Forgot Password", comment: "")
        label.textAlignment = .left
        label.font = label.font.withSize(25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    var emailTF : UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = .systemGray6
        tf.layer.cornerRadius = 15
        tf.layer.borderColor = UIColor.systemMint.cgColor
        tf.textAlignment = .center
        tf.layer.borderWidth = 2
        tf.resignFirstResponder()
        tf.text = NSLocalizedString( "Enter your email", comment: "")
       
      
        return tf
    }()
    
    var forgetBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle(NSLocalizedString("send", comment: ""), for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 20)
        btn.setTitleColor(UIColor.systemMint, for: UIControl.State.normal)
        btn.backgroundColor = .white
        btn.layer.cornerRadius = 15
        btn.setTitleColor(UIColor.systemMint, for: UIControl.State.normal)
        btn.layer.borderColor = UIColor.systemMint.cgColor
        btn.layer.borderWidth = 2
        btn.addTarget(self, action: #selector(forgetBtnBtnPressed), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(emailTF)
        view.addSubview(forgetBtn)
        view.addSubview(name)
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: view.topAnchor, constant: 500),
            name.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32),
            name.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32),
            name.heightAnchor.constraint(equalToConstant: 40),
            
            emailTF.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 10),
            emailTF.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32),
            emailTF.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32),
            emailTF.heightAnchor.constraint(equalToConstant: 40),
            
            forgetBtn.topAnchor.constraint(equalTo: emailTF.bottomAnchor, constant: 48),
            forgetBtn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32),
            forgetBtn.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32),
            forgetBtn.heightAnchor.constraint(equalToConstant: 40),
            ])
            
    }
    
    @objc func forgetBtnBtnPressed() {
        let auth = Auth.auth()
        
        auth.sendPasswordReset(withEmail: emailTF.text!) { (error) in
            if let error = error {
                
    let alert = UIAlertController(title: NSLocalizedString("Error", comment: "")
                                            , message: error.localizedDescription, preferredStyle:.alert)
                self.present(alert, animated: true, completion: nil)
                    alert.addAction(
                    UIAlertAction(title: NSLocalizedString("cancel", comment: ""),
                       style: UIAlertAction.Style.default,
                       handler: { Action in print("...")
                 })
                )
                

                return
            }

//                        )
            
            SPAlert.present(message: "A password resit email has been sent!", haptic: .none)
            
//            let alert = UIAlertController (title:"Hurray", message:"A password resit email has been sent!", preferredStyle: UIAlertController.Style.alert)
        }
        
    }

    
    
    
}
