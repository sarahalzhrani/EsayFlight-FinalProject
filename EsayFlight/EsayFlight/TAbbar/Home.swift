//
//  Home.swift
//  EsayFlight
//
//  Created by sara al zhrani on 18/04/1443 AH.
//

import UIKit


class Home : UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var blackSquare = UIView()
    let scrollView = UIScrollView()
    
    
    var RentCarBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle(NSLocalizedString("Rent Car\n in your destination", comment: ""), for: .normal)
        btn.titleLabel?.numberOfLines = 0
        btn.titleLabel?.lineBreakMode = .byWordWrapping
        btn.backgroundColor = UIColor(named: "Color-1")
        btn.setTitleColor(UIColor(red: 116/255, green: 102/255, blue: 145/250, alpha: 2), for: UIControl.State.normal)
        btn.layer.cornerRadius = 15
        btn.layer.borderColor = UIColor(red: 116/255, green: 102/255, blue: 145/250, alpha: 2).cgColor
        btn.layer.borderWidth = 2
        btn.addTarget(self, action: #selector(RentBtnPressed), for: .touchUpInside)
        return btn
    }()
    
    var newSBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle(NSLocalizedString("Airport News", comment: ""), for: .normal)
        btn.backgroundColor = UIColor(named: "Color-1")
        btn.setTitleColor(UIColor.systemMint, for: UIControl.State.normal)
        btn.layer.cornerRadius = 15
        btn.layer.borderColor = UIColor.systemMint.cgColor
        btn.layer.borderWidth = 2
        btn.addTarget(self, action: #selector(NewsBtnPressed), for: .touchUpInside)
        return btn
    }()
    
    
    
    var CallUsBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle(NSLocalizedString("Tell us your experience", comment: ""), for: .normal)
        btn.backgroundColor = UIColor(named: "Color-1")
        btn.setTitleColor(UIColor(red: 116/255, green: 102/255, blue: 145/250, alpha: 2), for: UIControl.State.normal)
        btn.layer.cornerRadius = 15
        btn.layer.borderColor = UIColor(red: 116/255, green: 102/255, blue: 145/250, alpha: 2).cgColor
        btn.layer.borderWidth = 2
        btn.addTarget(self, action: #selector(connectBtnPressed), for: .touchUpInside)
        return btn
    }()
    
    
    
    
    let MycollectionView: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            layout.minimumInteritemSpacing = 0
            layout.minimumLineSpacing =  12
            let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor(named: "Color")
        
            return cv
        }()
    
    let firstcollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing =  12
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor(named: "Color")
        return cv
    }()
    
    func setupCollectionConstraints() {
        firstcollectionView.translatesAutoresizingMaskIntoConstraints = false
        firstcollectionView.heightAnchor.constraint(equalToConstant: 340).isActive = true
        firstcollectionView.widthAnchor.constraint(equalToConstant: 340).isActive = true
        firstcollectionView.topAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        firstcollectionView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
    }
    
    func setupCollectionConstraints2() {
        MycollectionView.translatesAutoresizingMaskIntoConstraints = false
        MycollectionView.topAnchor.constraint(equalTo: namelable.bottomAnchor,constant: 10).isActive = true
        MycollectionView.leftAnchor.constraint(equalTo: scrollView.leftAnchor,constant: 16).isActive = true
        MycollectionView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        MycollectionView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width).isActive = true

        }
    
    
    let namelable: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("Suggest App For you :", comment:"")
        label.textColor = UIColor(red: 47/255, green: 79/255, blue: 79/250, alpha: 2)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = label.font.withSize(18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override func viewDidAppear(_ animated: Bool) {
       scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height+600)
    }
       
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.view = self.scrollView
        title = NSLocalizedString("Esay Flight", comment:"")

        blackSquare.backgroundColor = .white
        blackSquare.layer.cornerRadius = 55
        scrollView.addSubview(blackSquare)
        scrollView.addSubview(firstcollectionView)
        scrollView.addSubview(MycollectionView)
        scrollView.addSubview(RentCarBtn)
        scrollView.addSubview(CallUsBtn)
        scrollView.addSubview(namelable)
    
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.heightAnchor.constraint(equalToConstant: 2000).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true


        RentCarBtn.topAnchor.constraint(equalTo: scrollView.topAnchor,constant: 400).isActive = true
        RentCarBtn.leftAnchor.constraint(equalTo: scrollView.leftAnchor,constant: 20).isActive = true
        RentCarBtn.heightAnchor.constraint(equalToConstant: 100).isActive = true
        RentCarBtn.widthAnchor.constraint(equalToConstant: 350).isActive = true
        
        
        CallUsBtn.topAnchor.constraint(equalTo: RentCarBtn.bottomAnchor,constant: 20).isActive = true
        CallUsBtn.leftAnchor.constraint(equalTo: scrollView.leftAnchor,constant: 20).isActive = true
        CallUsBtn.heightAnchor.constraint(equalToConstant: 100).isActive = true
        CallUsBtn.widthAnchor.constraint(equalToConstant: 350).isActive = true
        
        
//     
        
        namelable.topAnchor.constraint(equalTo: CallUsBtn.bottomAnchor,constant: 30).isActive = true
        namelable.leftAnchor.constraint(equalTo: scrollView.leftAnchor,constant: 20).isActive = true
      
      
        firstcollectionView.delegate = self
        firstcollectionView.dataSource = self
        firstcollectionView.register(HomeCell.self, forCellWithReuseIdentifier: HomeCell.identifier)
        setupCollectionConstraints()
        
        MycollectionView.delegate = self
        MycollectionView.dataSource = self
        MycollectionView.register(HomeCell2.self, forCellWithReuseIdentifier: HomeCell2.identifier)
        setupCollectionConstraints2()
        
        
        view.isUserInteractionEnabled = true
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
    
    }
    
    
    
    @objc func RentBtnPressed() {
        let vc = CarRent()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)

    }
    
    @objc func NewsBtnPressed() {

    }
    
    @objc func connectBtnPressed() {
        let vc1 = CallUsVC()
        vc1.modalPresentationStyle = .fullScreen
        self.present(vc1, animated: true, completion: nil)

    
    }
    @objc func handleGesture(gesture: UISwipeGestureRecognizer) {
        if gesture.direction == .left {
            present(
                UINavigationController(rootViewController: Location()),
                animated: true,
                completion: nil
            )}}
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView === self.MycollectionView{
            return array4.count
        }
        
        return details.count
        
    }
        
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = firstcollectionView.dequeueReusableCell(withReuseIdentifier: HomeCell.identifier, for: indexPath) as! HomeCell
        
        let data = details[indexPath.row]
        cell.namelable.text = data.name
        cell.imageView.image = data.image
        cell.namelable2.text = data.descrption
        
        cell.backgroundColor =  UIColor(red: 116/255, green: 102/255, blue: 145/250, alpha: 2)
        cell.layer.cornerRadius = 10
        cell.layer.borderWidth = 25
        cell.layer.borderColor = UIColor.clear.cgColor
        cell.layer.masksToBounds = true
        
        cell.layer.shadowColor = UIColor.lightGray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        cell.layer.shadowRadius = 7
        cell.layer.shadowOpacity = 0.5
        cell.layer.masksToBounds = false
         
        if (collectionView === MycollectionView){
                
            let cell2 = MycollectionView.dequeueReusableCell(withReuseIdentifier: HomeCell2.identifier, for: indexPath) as! HomeCell2
            let data1 = array4[indexPath.row]
            
            cell2.imageView2.image = data1.photo3
            cell2.backgroundColor = UIColor(named: "Color-1")
            cell2.layer.cornerRadius = 10
            cell2.layer.borderWidth = 25
            cell2.layer.borderColor = UIColor.clear.cgColor
            cell2.layer.masksToBounds = true
                
            cell2.layer.shadowColor = UIColor.lightGray.cgColor
            cell2.layer.shadowOffset = CGSize(width: 0, height: 2.0)
            cell2.layer.shadowRadius = 7
            cell2.layer.shadowOpacity = 0.5
            cell2.layer.masksToBounds = false
                
                    return cell2
                
            
        }
            return cell
       
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView === self.MycollectionView{
            return CGSize(width: 350, height: 200)
        }
        return CGSize(width: 160, height: 160)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let data = details[indexPath.row]
        
        if collectionView === self.firstcollectionView {
            if indexPath.row == 0 {
                let navigationController = UINavigationController(
                    rootViewController: FlightSchedule()
                )
                navigationController.navigationBar.prefersLargeTitles = false
                
                navigationController.modalPresentationStyle = .fullScreen
                present(navigationController, animated: true, completion: nil)
                
            }else if indexPath.row == 1 {
                
//                let navigationController = UINavigationController(
//                    rootViewController: profiel()
                let vc = profiel()
                self.navigationController?.pushViewController(vc,animated: true)
                
//                navigationController.navigationBar.prefersLargeTitles = true
//                navigationController.modalPresentationStyle = .fullScreen
//                present(navigationController, animated: true, completion: nil)
                
               
                
            } else if indexPath.row == 2 {
                
                let navigationController = UINavigationController(
                    rootViewController: Terminal1()
                )
                navigationController.modalPresentationStyle = .fullScreen
                navigationController.navigationBar.prefersLargeTitles = true
                present(navigationController, animated: true, completion: nil)
                
            }  else if indexPath.row == 3 {
                let navigationController = UINavigationController(
                    rootViewController: serchForluggage()
                )
                navigationController.navigationBar.prefersLargeTitles = true
                navigationController.modalPresentationStyle = .fullScreen
                present(navigationController, animated: true, completion: nil)
            }}
        
        
        if collectionView === self.MycollectionView{
            let data1 = array4[indexPath.row]
            
            if indexPath.row == 0 {
                if let url1 = URL(string: "https://apps.apple.com/us/app/tripadvisor-plan-book-trips/id284876795") {
                          UIApplication.shared.open(url1)
                        }
                
                
            }else if indexPath.row == 1 {
                
                if let url6 = URL(string: "https://apps.apple.com/sa/app/tripadvisor-plan-book-trips") {
                          UIApplication.shared.open(url6)
                        }
    
              
            } else if indexPath.row == 2 {
                if let url7 = URL(string: "https://apps.apple.com/sa/app/ترافيل-ديف/id1426181755") {
                          UIApplication.shared.open(url7)
                        }
            } else if indexPath.row == 3 {
                if let url7 = URL(string: "https://apps.apple.com/us/app/ترافيل-ديف/id1426181755") {
                          UIApplication.shared.open(url7)
                        }
            
            
            
        }
        
        
    }
   
    
    
}

}
