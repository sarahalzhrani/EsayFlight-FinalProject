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
//        tf.backgroundColor = .systemGray6
        tf.layer.cornerRadius = 15
        tf.layer.borderColor = UIColor.white.cgColor
        tf.textAlignment = .center
        tf.layer.borderWidth = 2
        tf.resignFirstResponder()
        tf.placeholder = NSLocalizedString(  "Enter your Email", comment: "")
       
        return tf
    }()
    
    
    
    var nameTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
//        tf.backgroundColor = .systemGray6
        tf.layer.cornerRadius = 15
        tf.layer.borderColor = UIColor.white.cgColor
        tf.textAlignment = .center
        tf.layer.borderWidth = 2
        tf.resignFirstResponder()
        tf.placeholder = NSLocalizedString(  "Enter your name", comment: "")
       
        return tf
    }()
    let titlew : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = NSLocalizedString("Easy Flight", comment: "")
        label.font = UIFont(name: "Hoefler Text Italic" , size: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var passwordTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.isSecureTextEntry = true
//        tf.backgroundColor = .systemGray6
        tf.rightViewMode = .unlessEditing
        tf.layer.cornerRadius = 15
        tf.layer.borderColor = UIColor.white.cgColor
        tf.textAlignment = .center
        tf.layer.borderWidth = 2
        tf.resignFirstResponder()
        tf.rightViewMode = .always
        
        tf.placeholder = NSLocalizedString( "Enter your password", comment: "")
       
      
        return tf
    }()
    
    var loginBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle(NSLocalizedString("Login", comment: ""), for: .normal)
//        btn.backgroundColor = .white
        btn.setTitleColor(UIColor.white, for: UIControl.State.normal)
        btn.layer.cornerRadius = 15
        btn.layer.borderColor = UIColor.white.cgColor
        btn.layer.borderWidth = 2
        btn.addTarget(self, action: #selector(loginBtnPressed), for: .touchUpInside)
        return btn
    }()
    var registerBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle(NSLocalizedString("Register", comment: ""), for: .normal)
//        btn.backgroundColor = .white
        btn.layer.cornerRadius = 15
        btn.setTitleColor(UIColor.white, for: UIControl.State.normal)
        btn.layer.borderColor = UIColor.white.cgColor
        btn.layer.borderWidth = 2
        btn.addTarget(self, action: #selector(registerBtnPressed), for: .touchUpInside)
        return btn
    }()
    
    var forgetBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle(NSLocalizedString("Forget your password?", comment: ""), for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 12)
        btn.setTitleColor(UIColor.white, for: UIControl.State.normal)
        btn.addTarget(self, action: #selector(forgetBtnBtnPressed), for: .touchUpInside)
        return btn
    }()
    
    var button: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "close"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 5, left: -15, bottom: 5, right: 15)
        button.addTarget(self, action: #selector(showandhiden), for: .touchUpInside)
        return button
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
        nameTF.resignFirstResponder()
             return true
         }

    override func viewDidLoad() {
        super.viewDidLoad()

        passwordTF.addSubview(button)
        view.addSubview(nameTF)
        view.addSubview(emailTF)
        view.addSubview(passwordTF)
        view.addSubview(loginBtn)
        view.addSubview(registerBtn)
        view.addSubview(forgetBtn)
        view.addSubview(titlew)
        self.emailTF.delegate = self
        self.passwordTF.delegate = self
        self.nameTF.delegate = self
        view.backgroundColor = UIColor.systemMint
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "first")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
       
        passwordTF.rightView = button
        NSLayoutConstraint.activate([
            nameTF.topAnchor.constraint(equalTo: view.topAnchor, constant: 550),
            nameTF.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32),
            nameTF.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32),
            nameTF.heightAnchor.constraint(equalToConstant: 40),
            
            emailTF.topAnchor.constraint(equalTo: nameTF.bottomAnchor, constant: 24),
            emailTF.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32),
            emailTF.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32),
            emailTF.heightAnchor.constraint(equalToConstant: 40),
            
            passwordTF.topAnchor.constraint(equalTo: emailTF.bottomAnchor, constant: 24),
            passwordTF.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32),
            passwordTF.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32),
            passwordTF.heightAnchor.constraint(equalToConstant: 40),
            
            loginBtn.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 48),
            loginBtn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 200),
            loginBtn.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32),
            loginBtn.heightAnchor.constraint(equalToConstant: 40),
            
            forgetBtn.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 5),
//            forgetBtn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32),
            forgetBtn.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32),
            
            registerBtn.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 48),
            registerBtn.leftAnchor.constraint(equalTo: view.leftAnchor,  constant: 32),
            registerBtn.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -200),
            registerBtn.heightAnchor.constraint(equalToConstant: 40),
            
            
            titlew.topAnchor.constraint(equalTo: view.topAnchor,constant: 230),
            titlew.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 140),
            titlew.heightAnchor.constraint(equalToConstant: 200),
            titlew.widthAnchor.constraint(equalToConstant: 200),
            
//            button.topAnchor.constraint(equalTo: view.topAnchor),
            button.rightAnchor.constraint(equalTo: passwordTF.rightAnchor,constant: -16),

//            button.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 120),
            button.heightAnchor.constraint(equalToConstant: 40),
            button.widthAnchor.constraint(equalToConstant: 30),
        ])
   }
    
    @objc func showandhiden(_ sender: Any) {
        print("itsworke")
        (sender as! UIButton).isSelected = !(sender as! UIButton).isSelected
        if  (sender as! UIButton).isSelected {
            self.passwordTF.isSecureTextEntry = false
            button.setImage(UIImage(named: "open"), for: .normal)
            
        } else {
        self.passwordTF.isSecureTextEntry = true
        button.setImage(UIImage(named: "close"), for: .normal)
    }
        
    }
    
    @objc func registerBtnPressed() {
        
        if let email = emailTF.text, email.isEmpty == false,
           let password = passwordTF.text, password.isEmpty == false {
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if error == nil {
                    // go to main vc

                    let vc1 = WelcomeViewController()
                    vc1.modalPresentationStyle = .fullScreen
                    self.present(vc1, animated: true, completion: nil)

                } else {
                    
                    
        let alert = UIAlertController(title: NSLocalizedString("Error", comment: "")
                                      , message: error?.localizedDescription, preferredStyle:.alert)
                    self.present(alert, animated: true, completion: nil)
                        alert.addAction(
                        UIAlertAction(title: NSLocalizedString("cancel", comment: ""),
                           style: UIAlertAction.Style.default,
                           handler: { Action in print("...")
                     })
                    )
                    print(error?.localizedDescription )
                }
                guard let currentUserID = Auth.auth().currentUser?.uid else {return}
                Firestore.firestore().document("users/\(currentUserID)").setData([
                    "id" : currentUserID,
                    "email" : self.emailTF.text as Any,
                    "name" : self.nameTF.text as Any
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
                    let alert = UIAlertController(title: NSLocalizedString("Error", comment: "")
                                                  , message: error?.localizedDescription, preferredStyle:.alert)
                                self.present(alert, animated: true, completion: nil)
                                    alert.addAction(
                                    UIAlertAction(title: NSLocalizedString("cancel", comment: ""),
                                       style: UIAlertAction.Style.default,
                                       handler: { Action in print("...")
                                 })
                                )
                    print(error?.localizedDescription)
                }
            }
        }

        }
        
    @objc func forgetBtnBtnPressed() {
        print("it's worke")
        let vc1 = RestPassWoord()
        vc1.modalPresentationStyle = .fullScreen
        self.present(vc1, animated: true, completion: nil)
//        self.navigationController?.pushViewController(vc1,animated: true)
        }
        
    }
    
    
    




