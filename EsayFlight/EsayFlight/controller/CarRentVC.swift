//
//  FreeWIfi.swift
//  EsayFlight
//
//  Created by sara al zhrani on 24/04/1443 AH.
//

import UIKit

class CarRent: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    
    lazy var collectionView1: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing =  12
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor(named: "Color")
        return cv
    }()
    
    
    func setupCollectionConstraints() {
        collectionView1.translatesAutoresizingMaskIntoConstraints = false
        collectionView1.heightAnchor.constraint(equalToConstant: 550).isActive = true
        collectionView1.widthAnchor.constraint(equalToConstant: 320).isActive = true
        collectionView1.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: 60).isActive = true
        collectionView1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    
    
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 140, height: 140)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array3.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView1.dequeueReusableCell(withReuseIdentifier: CarRentCell.identifier, for: indexPath) as! CarRentCell
          let data = array3[indexPath.row]
        cell.imageView3.image = data.image2
        cell.CarNameble.text = data.name2
        
        
        cell.backgroundColor = .white
        cell.layer.cornerRadius = 10
        cell.layer.borderWidth = 25
        cell.layer.borderColor = UIColor.clear.cgColor
        cell.layer.masksToBounds = true
        
        cell.layer.shadowColor = UIColor.lightGray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        cell.layer.shadowRadius = 7
        cell.layer.shadowOpacity = 0.5
        cell.layer.masksToBounds = false
        
        return cell
        
    }
    
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView1)
        setupCollectionConstraints()
         collectionView1.delegate = self
         collectionView1.dataSource = self
        view.backgroundColor = UIColor(named: "Color")
     collectionView1.register(CarRentCell.self, forCellWithReuseIdentifier: CarRentCell.identifier)
        
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 60, width: view.frame.size.width, height: 60))
        view.addSubview(navBar)
        let navItem = UINavigationItem(title: NSLocalizedString("Rent car Office", comment: ""))
        let doneItem = UIBarButtonItem(title:NSLocalizedString("Back", comment: ""), style: .plain, target: self, action: #selector(baccck))
        navItem.leftBarButtonItem = doneItem

        navBar.setItems([navItem], animated: false)
        
        
    }
    
    
    
    @objc func baccck() {

        let vc = TabBarVC()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let data = array3[indexPath.row]
        
        if indexPath.row == 0 {
            
         if let url = URL(string: "https://www.budget.com/en/home") {
                   UIApplication.shared.open(url)
                 }
        }
        if indexPath.row ==  1{
            
            if let url1 = URL(string: "https://www.avis.com.sa") {
                      UIApplication.shared.open(url1)
                    }
        }
        if indexPath.row ==  2{
            
            if let url2 = URL(string: "https://www.rentalcars.com/ar/country/sa/hanco/") {
                      UIApplication.shared.open(url2)
                    }
        }
        if indexPath.row ==  3 {
            
            if let url3 = URL(string: "https://www.hertzarabic.com") {
                      UIApplication.shared.open(url3)
                    }
        }
        if indexPath.row ==  4 {
            
            if let url4 = URL(string: "https://www.key.sa") {
                      UIApplication.shared.open(url4)
                    }
        }
        
        if indexPath.row ==  5 {
            
            if let url5 = URL(string: "https://www.iyelo.com/ar/") {
                      UIApplication.shared.open(url5)
                
            }
        }
        
    }
    
    
}



class CarRentCell : UICollectionViewCell{
    
    static let identifier = "CarRentCell"
    

    
    var imageView3: UIImageView = {
      let imageView = UIImageView()
      imageView.image = UIImage(named: "")
      imageView.layer.masksToBounds = true
      imageView.layer.cornerRadius = 25
      imageView.translatesAutoresizingMaskIntoConstraints = false
      return imageView
    }()
    
    
    let CarNameble: UILabel = {
        let label = UILabel()
        label.text = "name"
        label.textColor = .black
        label.font = label.font.withSize(20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(imageView3)
        self.addSubview(CarNameble)
       
        imageView3.topAnchor.constraint(equalTo: self.topAnchor,constant: 15).isActive = true
        imageView3.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30).isActive = true
        imageView3.heightAnchor.constraint(equalToConstant: 90).isActive = true
        imageView3.widthAnchor.constraint(equalToConstant:90).isActive = true
        
        CarNameble.topAnchor.constraint(equalTo: self.topAnchor,constant: 110).isActive = true
        CarNameble.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
   
    }
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
