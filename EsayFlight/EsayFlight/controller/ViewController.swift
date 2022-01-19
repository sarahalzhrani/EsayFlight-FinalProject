//
//  ViewController.swift
//  EsayFlight
//
//  Created by sara al zhrani on 06/06/1443 AH.
//

import UIKit
import FirebaseAuth
private let reuseIdentifier = "SettingsCell"

class ViewController: UIViewController {
    var  social : CommunicationOption = .changelanguage
    var appDelegate = UIApplication.shared.windows.first
    
    var tableView: UITableView!
    var userInfoHeader: UserInfoHeader!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    
    func configureTableView() {
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 60
        
        tableView.register(SettingsCell.self, forCellReuseIdentifier: reuseIdentifier)
        view.addSubview(tableView)
        tableView.frame = view.frame
        
        let frame = CGRect(x: 0, y: 88, width: view.frame.width, height: 100)
        userInfoHeader = UserInfoHeader(frame: frame)
        tableView.tableHeaderView = userInfoHeader
        tableView.tableFooterView = UIView()
    }
    
    func configureUI() {
        configureTableView()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.barTintColor = UIColor(red: 116/255, green: 102/255, blue: 145/250, alpha: 2)
        navigationItem.title = NSLocalizedString("Settings", comment:"")
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return settingsSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = settingsSection(rawValue: section) else {return 0 }

        switch section{
        case .Social: return SocialOption.allCases.count
        case .communication: return CommunicationOption.allCases.count
   
        }
       
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor  =  UIColor(red: 116/255, green: 102/255, blue: 145/250, alpha: 2)
        let title = UILabel()
        title.font = UIFont.boldSystemFont(ofSize: 16)
        title.textColor = .white
        title.text = settingsSection(rawValue: section)?.description
        view.addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        title.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        
        return view
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! SettingsCell
        guard let section = settingsSection(rawValue:indexPath.section) else {return UITableViewCell()}
        
        switch section{
        case .Social:
            let social = SocialOption(rawValue: indexPath.row)
            cell.sectionType = social
        case .communication:
            let communications = CommunicationOption(rawValue: indexPath.row)
            cell.sectionType = communications
            cell.switchControl.tag = indexPath.row
            cell.switchControl.addTarget(self, action: #selector(switchValueDidChange), for: .valueChanged)
        }
        return cell
    }
    
    
    @objc func switchValueDidChange(_ sender: UISwitch) {
            if sender.isOn {
                if sender.tag == 0 {
                    social = .darkmode
                } else if sender.tag == 1 {
                    social =  .changelanguage
                }
                else {
                    social = .email
                }
                switch social {
                case .darkmode:
                    appDelegate?.overrideUserInterfaceStyle = .dark
                    UserDefaults.standard.set(true, forKey: "switchState")
                    break
                case .changelanguage:
                    let alert1 = UIAlertController(
                        title: ("Warning"),
                        message: "The app will exit to change the language",
                        preferredStyle: .alert)
                    alert1.addAction(
                        UIAlertAction(
                            title: "OK",
                            style: .default,
                            handler: { action in
                                let currentLang = Locale.current.languageCode
                                let newLanguage = currentLang == "en" ? "ar" : "en"
                                UserDefaults.standard.setValue([newLanguage], forKey: "AppleLanguages")
                                exit(0)
                                print("OK")
                            }
                        )
                    )
                    present(alert1, animated: true, completion: nil)
                    print("try2")
                    break
                case .email:
                    let alert1 = UIAlertController(
                        title: ("Warning"),
                        message: "Allow us to send our new",
                        preferredStyle: .alert)
                    alert1.addAction(
                        UIAlertAction(
                            title: "OK",
                            style: .default,
                            handler: { action in
                                print("OK")
                            }
                        )
                    )
                    present(alert1, animated: true, completion: nil)
                    break
                default:
                    print("trydefault")
                }
            }
            else {
                if sender.tag == 0 {
                    social = .darkmode
    
                    appDelegate?.overrideUserInterfaceStyle = .light
                    UserDefaults.standard.set(false, forKey: "switchState")
                }
            }
        }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let section = settingsSection(rawValue:indexPath.section) else { return }
        switch section{
        case .Social:
            let social = SocialOption(rawValue: indexPath.row)
            if indexPath.row == 0 {
                let vc =  Editingprofile()
                present(vc, animated: true, completion: nil)
               
                
            } else if indexPath.row == 1 {
                let firebaseAuth = Auth.auth()
                do {
                    try firebaseAuth.signOut()
                    dismiss(animated: true, completion: nil)
                } catch let signOutError as NSError {
                    print ("Error signing out: \(signOutError.localizedDescription)")
                }
                            let vc = LoginVC()
                            vc.modalPresentationStyle = .fullScreen
                            self.present(vc, animated: true, completion: nil)
                
            }
         
        case .communication:
            print(CommunicationOption(rawValue: indexPath.row))
        }
    }
    
    
}
    
