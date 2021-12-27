//
//  ViewController.swift
//  EsayFlight
//
//  Created by sara al zhrani on 17/04/1443 AH.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class LoginVC: UIViewController, UITextFieldDelegate {
    
    var blackSquare: UIView!
    
    var emailTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = .systemGray6
        tf.layer.cornerRadius = 15
        tf.layer.borderColor = UIColor.systemMint.cgColor
        tf.textAlignment = .center
        tf.layer.borderWidth = 2
        tf.resignFirstResponder()
        tf.text = NSLocalizedString(  "Enter your Email", comment: "")
       
        return tf
    }()
    
    var passwordTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.isSecureTextEntry = true
        tf.backgroundColor = .systemGray6
        tf.layer.cornerRadius = 15
        tf.layer.borderColor = UIColor.systemMint.cgColor
        tf.textAlignment = .center
        tf.layer.borderWidth = 2
        tf.resignFirstResponder()
        tf.text = NSLocalizedString( "Enter your password", comment: "")
       
      
        return tf
    }()
    
    var loginBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle(NSLocalizedString("Login", comment: ""), for: .normal)
        btn.backgroundColor = .white
        btn.setTitleColor(UIColor.systemMint, for: UIControl.State.normal)
        btn.layer.cornerRadius = 15
        btn.layer.borderColor = UIColor.systemMint.cgColor
        btn.layer.borderWidth = 2
        btn.addTarget(self, action: #selector(loginBtnPressed), for: .touchUpInside)
        return btn
    }()
    var registerBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle(NSLocalizedString("Register", comment: ""), for: .normal)
        btn.backgroundColor = .white
        btn.layer.cornerRadius = 15
        btn.setTitleColor(UIColor.systemMint, for: UIControl.State.normal)
        btn.layer.borderColor = UIColor.systemMint.cgColor
        btn.layer.borderWidth = 2
        btn.addTarget(self, action: #selector(registerBtnPressed), for: .touchUpInside)
        return btn
    }()
    
    var forgetBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle(NSLocalizedString("Forget your password?", comment: ""), for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 12)
        btn.setTitleColor(UIColor.systemMint, for: UIControl.State.normal)
        btn.addTarget(self, action: #selector(forgetBtnBtnPressed), for: .touchUpInside)
        return btn
    }()
    var imageView: UIImageView = {
      let imageView = UIImageView()
      imageView.image = UIImage(named: "Frame 1")
      imageView.translatesAutoresizingMaskIntoConstraints = false
      return imageView
    }()
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
          emailTF.resignFirstResponder()
          passwordTF.resignFirstResponder()
             return true
         }

    override func viewDidLoad() {
        super.viewDidLoad()
        blackSquare = UIView(frame: CGRect(x: 0, y: 100, width: view.bounds.width, height: 800))
        blackSquare.backgroundColor = .white
        blackSquare.layer.cornerRadius = 55
        view.addSubview(blackSquare)
        view.addSubview(emailTF)
        view.addSubview(passwordTF)
        view.addSubview(loginBtn)
        view.addSubview(registerBtn)
        view.addSubview(forgetBtn)
        view.addSubview(imageView)
        self.emailTF.delegate = self
        self.passwordTF.delegate = self
        view.backgroundColor = UIColor.systemMint
        
        
        NSLayoutConstraint.activate([
            emailTF.topAnchor.constraint(equalTo: view.topAnchor, constant: 500),
            emailTF.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32),
            emailTF.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32),
            emailTF.heightAnchor.constraint(equalToConstant: 40),
            
            passwordTF.topAnchor.constraint(equalTo: emailTF.bottomAnchor, constant: 24),
            passwordTF.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32),
            passwordTF.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32),
            passwordTF.heightAnchor.constraint(equalToConstant: 40),
            
            loginBtn.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 48),
            loginBtn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32),
            loginBtn.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32),
            loginBtn.heightAnchor.constraint(equalToConstant: 40),
            
            forgetBtn.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 5),
//            forgetBtn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32),
            forgetBtn.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32),
            
            registerBtn.topAnchor.constraint(equalTo: loginBtn.bottomAnchor, constant: 24),
            registerBtn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32),
            registerBtn.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32),
            registerBtn.heightAnchor.constraint(equalToConstant: 40),
            
            
            imageView.topAnchor.constraint(equalTo: view.topAnchor,constant: 200),
            imageView.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 90),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            imageView.widthAnchor.constraint(equalToConstant: 200),
        ])
   }
    
    
    
    @objc func registerBtnPressed() {
        
        if let email = emailTF.text, email.isEmpty == false,
           let password = passwordTF.text, password.isEmpty == false {
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if error == nil {
                    // go to main vc
                    let vc = UINavigationController(rootViewController: TabBarVC())
                    vc.modalTransitionStyle = .crossDissolve
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true, completion: nil)
                } else {
                    print(error?.localizedDescription )
                }
                guard let currentUserID = Auth.auth().currentUser?.uid else {return}
                Firestore.firestore().document("users/\(currentUserID)").setData([
                    "id" : currentUserID,
                    "email" : self.emailTF.text as Any
                ])
            }
        }
    }
    @objc func loginBtnPressed() {
        if let email = emailTF.text, email.isEmpty == false,
           let password = passwordTF.text, password.isEmpty == false {
            Auth.auth().signIn(withEmail: email, password: password) { result, error in
                if error == nil {
                    // go to main vc
                    let vc = UINavigationController(rootViewController: TabBarVC())
                    vc.modalTransitionStyle = .crossDissolve
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true, completion: nil)
                } else {
                    print(error?.localizedDescription)
                }
            }
        }

        }
        
    @objc func forgetBtnBtnPressed() {
        let vc = RestPassWoord()
        self.navigationController?.pushViewController(vc,animated: true)
        }
        
    }
    
    
    




