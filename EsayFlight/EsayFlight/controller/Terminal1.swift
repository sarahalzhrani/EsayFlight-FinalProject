//
//  Terminal1.swift
//  EsayFlight
//
//  Created by sara al zhrani on 23/04/1443 AH.
//

import UIKit


class Terminal1 : UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var segmentedControl = UISegmentedControl()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = NSLocalizedString("Service", comment:"")
        let nv = UINavigationController()
        nv.navigationBar.prefersLargeTitles = false
        addControl() 
        view.backgroundColor = .white
        view.addSubview(collectionView1)
        view.addSubview(collectionView2)
        if segmentedControl.selectedSegmentIndex == 0 {
           
            collectionView1.isHidden = false
            collectionView2.isHidden = true
            
        } else {
           
            collectionView1.isHidden = true
            collectionView2.isHidden = false
            
            
        }
            
        setupCollectionConstraints()
        setupCollectionConstraints2()

       
        collectionView1.delegate = self
        collectionView1.dataSource = self
        collectionView2.delegate = self
        collectionView2.dataSource = self
        collectionView1.register(Terminal1Cell.self, forCellWithReuseIdentifier: Terminal1Cell.identifier)
        collectionView2.register(Terminal2Cell.self, forCellWithReuseIdentifier: Terminal2Cell.identifier)
       
        
        
        self.navigationItem.hidesBackButton = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: NSLocalizedString("Home", comment: ""), style: .plain, target: self, action: #selector(handleCancel))
      
    }
    
    
    @objc func handleCancel() {
        dismiss(animated: true, completion: nil)
    }
    
    lazy var collectionView1: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
//        layout.itemSize = CGSize(width: view.frame.width, height: 200)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing =  12
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        return cv
    }()
    
    lazy var collectionView2: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing =  12
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        return cv
    }()
    
    func setupCollectionConstraints() {
        collectionView1.translatesAutoresizingMaskIntoConstraints = false
        collectionView1.heightAnchor.constraint(equalToConstant: 550).isActive = true
        collectionView1.widthAnchor.constraint(equalToConstant: 320).isActive = true
        collectionView1.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: 60).isActive = true
        collectionView1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    
    
    }
    func setupCollectionConstraints2() {
        collectionView2.translatesAutoresizingMaskIntoConstraints = false
        collectionView2.heightAnchor.constraint(equalToConstant: 320).isActive = true
        collectionView2.widthAnchor.constraint(equalToConstant: 320).isActive = true
        collectionView2.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        collectionView2.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView === self.collectionView2{
            return array2.count
        }
        
        return array1.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell =  collectionView1.dequeueReusableCell(withReuseIdentifier: Terminal1Cell.identifier, for: indexPath) as! Terminal1Cell
        let data = array1[indexPath.row]
       
        cell.imageView.image = data.image
        cell.resturantNameble.text = data.name
        
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
        
        if (collectionView === collectionView2){
                
                let cell2 = collectionView2.dequeueReusableCell(withReuseIdentifier: Terminal2Cell.identifier, for: indexPath) as! Terminal2Cell
                let data1 = array2[indexPath.row]
               
            cell2.imageView1.image = data1.image1
            cell2.resturantNameble1.text = data1.name1
                
            cell2.backgroundColor = .white
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
        return CGSize(width: 140, height: 140)
    }
    

    
    
    func addControl()  {

        segmentedControl.insertSegment(withTitle: "terminal1", at: 0, animated: true)
        segmentedControl.setTitle("terminal1", forSegmentAt: 0)
        segmentedControl.insertSegment(withTitle: "terminal2", at: 1, animated: true)
        segmentedControl.setTitle("terminal2", forSegmentAt: 1)
        segmentedControl.addTarget(self, action: #selector(Segment), for: .valueChanged)
        segmentedControl.frame = CGRect(x: 60, y: 150, width: 300, height: 40)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.backgroundColor = UIColor.systemMint
        segmentedControl.layer.borderColor = UIColor.white.cgColor
        segmentedControl.selectedSegmentTintColor = UIColor.white
        segmentedControl.layer.borderWidth = 1
           view.addSubview(segmentedControl)
        segmentedControl.isUserInteractionEnabled = true
       }
    @objc func Segment(_ sender: Any) {
      switch segmentedControl.selectedSegmentIndex {
      case 0:
        collectionView1.isHidden = true
        collectionView2.isHidden = false
         
      case 1:

          collectionView1.isHidden = false
          collectionView2.isHidden = true
         
         
      default:
        break;
      }}


 
}



