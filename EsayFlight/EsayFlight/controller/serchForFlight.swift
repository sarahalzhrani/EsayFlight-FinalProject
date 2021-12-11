//
//  serchForFlight.swift
//  EsayFlight
//
//  Created by sara al zhrani on 19/04/1443 AH.
//

import UIKit

struct Trip {
    let id:String
    let gate:String
    let time: Int?
}

class serchForFlight : UIViewController {
    
    
    override func viewDidLoad() {
          super.viewDidLoad()
          SetupView()
        
  
  
      }
    
    
    private func SetupView () {
        view.backgroundColor = .white
    self.navigationItem.hidesBackButton = true

           navigationItem.leftBarButtonItem = UIBarButtonItem(title: NSLocalizedString("Back", comment: ""), style: .plain, target: self, action: #selector(handleCancel))
             navigationItem.rightBarButtonItem = UIBarButtonItem(title: NSLocalizedString("✚", comment: ""), style: .plain, target: self, action: #selector(openNewPage))
   
}
    
    
    @objc func handleCancel() {
         dismiss(animated: true, completion: nil)
     }
 
     @objc func openNewPage() {
         let alert = UIAlertController(title: "", message: "", preferredStyle: .actionSheet)
         alert.addAction(UIAlertAction(title: "Add Flight", style: .default, handler: { Action in
             self.present(FlightSchedule(), animated: true, completion: nil)
             
         } ))
         alert.addAction(UIAlertAction(title: "Scan parcod", style: .default, handler: { Action in
             self.present(ScanCode(), animated: true, completion: nil)
                                      
         }))
         alert.addAction(UIAlertAction(title: "cancel", style: .destructive, handler: nil))
         present(alert, animated: true, completion: nil)
   
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
