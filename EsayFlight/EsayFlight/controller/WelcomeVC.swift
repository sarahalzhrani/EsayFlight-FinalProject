//
//  WelcomeVC.swift
//  EsayFlight
//
//  Created by sara al zhrani on 23/05/1443 AH.
//

import UIKit

class WelcomeViewController: UIViewController {
    static let identifire = "welcome"

    var holderView = UIView()
    let scrollView = UIScrollView()
    override func viewDidLoad() {
        super.viewDidLoad()
         
        view.backgroundColor = .red
      
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configure()
    }
    private func configure() {
        self.holderView = self.view
        scrollView.frame = holderView.bounds
        holderView.addSubview(scrollView)
        holderView.backgroundColor = .white
        holderView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height))
        let titles = ["Welcome to Esay Flight", "If you are having difficulty at the airport","the App will help you in airport"]
           for x in 0..<3 {
        let pageview = UIView(frame: CGRect(x: CGFloat(x) * holderView.frame.size.width,y: 0, width: holderView.frame.size.width, height: holderView.frame.size.height))
        scrollView.addSubview(pageview)
    // Title, iamge, button
        let label = UILabel(frame: CGRect(x: 10, y: 70, width: pageview.frame.size.width-20, height: 120))
        let imageView = UIImageView(frame: CGRect(x: 10, y: 10+128+10, width: pageview.frame.size.width-20, height:pageview.frame.size.height - 60 - 130 - 15))
        let button = UIButton(frame: CGRect(x: 10, y: pageview.frame.size.height-80, width: pageview.frame.size.width-20, height:50))
            label.textAlignment = .center
            label.font = UIFont(name: "Helvetica-Bold", size: 20)
            pageview.addSubview(label)
            label.text = titles[x]
            label.numberOfLines = 0
            imageView.contentMode = .scaleAspectFit
            imageView.image = UIImage(named: "welcome_\(x+1)")
            pageview.addSubview(imageView)
               button.layer.cornerRadius = 13
               button.setTitleColor(.white, for: .normal)
               button.backgroundColor = UIColor(red: 116/255, green: 102/255, blue: 145/250, alpha: 2)
               button.setTitle("Continue", for: .normal)
                if x == 2{
               button.setTitle("Get Started", for: .normal)
            }
               button.addTarget(self, action: #selector(didtapButtont(_:)), for: .touchUpInside)
               button.tag = x+1
            pageview.addSubview(button)
           }
        scrollView.contentSize = CGSize(width: holderView.frame.size.width*3, height: 0)
        scrollView.isPagingEnabled = true
    }
    
    
         @objc func didtapButtont(_ button: UIButton) {
             guard button.tag < 3 else {
               // dismiss
                 let vc = UINavigationController(rootViewController: TabBarVC())
                 vc.modalTransitionStyle = .crossDissolve
                 vc.modalPresentationStyle = .fullScreen
                 self.present(vc, animated: true, completion: nil)
               return
                 
             }
          // seroll to next page
              scrollView.setContentOffset(CGPoint(x: holderView.frame.size.width * CGFloat(button.tag), y: 0), animated: true)
              
           }
}
