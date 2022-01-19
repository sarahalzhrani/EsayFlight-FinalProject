//
//  CallUsVC.swift
//  EsayFlight
//
//  Created by sara al zhrani on 04/05/1443 AH.
//

import UIKit
import MessageUI

class CallUsVC: UIViewController {
    var line: UIView!
    
    var imageView: UIImageView = {
      let imageView = UIImageView()
      imageView.image = UIImage(named: "Frame 1")
      imageView.translatesAutoresizingMaskIntoConstraints = false
      return imageView
    }()
    var imageView2: UIImageView = {
      let imageView = UIImageView()
      imageView.image = UIImage(named: "email")
      imageView.translatesAutoresizingMaskIntoConstraints = false
      return imageView
    }()
    var imageView3: UIImageView = {
      let imageView = UIImageView()
      imageView.image = UIImage(named: "telephone-call")
      imageView.translatesAutoresizingMaskIntoConstraints = false
      return imageView
    }()
    
    let name: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("There is a specialized team working to improve the passenger experience at the airport. Please contact us through the following channels :", comment: "")
        label.textAlignment = .left
        label.numberOfLines = 0
//        label.textColor = .black
        label.font = label.font.withSize(18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let Button1 : UIButton = {
        $0.backgroundColor = .white
        $0.setTitle(NSLocalizedString("+966 920011233", comment: ""), for: .normal)
        $0.setTitleColor(UIColor(red: 47/255, green: 79/255, blue: 79/250, alpha: 2), for: .normal)
        $0.layer.cornerRadius = 22.5
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addTarget(self, action: #selector(call), for: .touchUpInside)
        return $0
    }(UIButton())
    
    let Button2 : UIButton = {
        $0.backgroundColor = .white
        $0.setTitle(NSLocalizedString("kaiacustomercare@kaia.gov.sa", comment: ""), for: .normal)
        $0.setTitleColor(UIColor(red: 47/255, green: 79/255, blue: 79/250, alpha: 2), for: .normal)
        $0.layer.cornerRadius = 22.5
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addTarget(self, action: #selector(sendEmail), for: .touchUpInside)
        return $0
    }(UIButton())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showMailComposer()
        view.backgroundColor = UIColor(named: "Color")
        view.addSubview(imageView)
        view.addSubview(imageView2)
        view.addSubview(imageView3)
        view.addSubview(name)
        view.addSubview(Button1)
        view.addSubview(Button2)
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 60, width: view.frame.size.width, height: 60))
        view.addSubview(navBar)
        let navItem = UINavigationItem(title: NSLocalizedString("Tell us your experience", comment: ""))
        let doneItem = UIBarButtonItem(title:NSLocalizedString("Back", comment: ""), style: .plain, target: self, action: #selector(baccck2))
        navItem.leftBarButtonItem = doneItem

        navBar.setItems([navItem], animated: false)
        
        
        line = UIView(frame: CGRect(x: 0, y: 380, width: 450, height:1))
        line.backgroundColor = .systemGray3
        line.layer.cornerRadius = 10
        view.addSubview(line)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor,constant: 100),
            imageView.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 90),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            
            imageView2.topAnchor.constraint(equalTo: view.topAnchor,constant: 400),
            imageView2.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 17),
            imageView2.heightAnchor.constraint(equalToConstant: 50),
            imageView2.widthAnchor.constraint(equalToConstant: 50),
            
            
            Button1.topAnchor.constraint(equalTo: view.topAnchor,constant: 500),
            Button1.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 50),
            Button1.heightAnchor.constraint(equalToConstant: 50),
            Button1.widthAnchor.constraint(equalToConstant: 200),
            
            Button2.topAnchor.constraint(equalTo: view.topAnchor,constant: 400),
            Button2.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 80),
            Button2.heightAnchor.constraint(equalToConstant: 50),
            Button2.widthAnchor.constraint(equalToConstant: 250),
            
            imageView3.topAnchor.constraint(equalTo: view.topAnchor,constant: 500),
            imageView3.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 17),
            imageView3.heightAnchor.constraint(equalToConstant: 50),
            imageView3.widthAnchor.constraint(equalToConstant: 50),
            
            name.topAnchor.constraint(equalTo: view.topAnchor,constant: 290),
            name.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16),
            name.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -16),
            
        ])
            
}
    
    @objc func baccck2() {

        let vc = TabBarVC()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    @objc func call() {
        
        if let url = URL(string: "tel://\(920011233)") {
               UIApplication.shared.openURL(url)
            print(url)

             }

    }
    @objc func sendEmail() {
       
        showMailComposer()
    
    }
    
    func showMailComposer(){
        
        print("it's pressed")
        
        guard MFMailComposeViewController.canSendMail() else {

            return
        }

        let composer = MFMailComposeViewController()
        composer.mailComposeDelegate = self
        composer.setToRecipients(["kaiacustomercare@kaia.gov.sa"])
        composer.setSubject("")
        composer.setMessageBody("", isHTML: false)

        present(composer, animated: true)
    }
    
}

extension CallUsVC: MFMailComposeViewControllerDelegate {
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        if let _ = error {
          
            controller.dismiss(animated: true)
            return
        }
        
        switch result {
        case .cancelled:
            print("Cancelled")
        case .failed:
            print("Failed to send")
        case .saved:
            print("Saved")
        case .sent:
            print("Email Sent")
        @unknown default:
            break
        }
        
        controller.dismiss(animated: true)
    }
}





