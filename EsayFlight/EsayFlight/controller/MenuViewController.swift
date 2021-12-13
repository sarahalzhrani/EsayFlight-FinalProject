//
//  MenuViewController.swift
//  EsayFlight
//
//  Created by sara al zhrani on 05/05/1443 AH.
//

import UIKit

protocol MenuViewControllerDelegate: AnyObject{
  func didSelect(menuItem: MenuViewController.MenuOPtions)
}
class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  weak var delegate: MenuViewControllerDelegate?
  enum MenuOPtions: String, CaseIterable {
    case home
    case info
    case appRating
    case shareApp
    case settings
    case centers
    case dark
    case language
    case about
    case settt
  var localized: String {
          switch self {
          case .home:
            return NSLocalizedString("47", comment: "الصفحة الرئيسي")
          case .info:
            return NSLocalizedString("48", comment: "")
          case .appRating:
            return NSLocalizedString("49", comment: "")
          case .shareApp:
            return NSLocalizedString("50", comment: "القائمه السوداء")
          case .settings:
            return NSLocalizedString("51", comment: "")
          case .centers:
            return NSLocalizedString("52", comment: "")
          case .dark:
            return NSLocalizedString("53", comment:"الوضع الليلي")
          case .language:
            return NSLocalizedString("54", comment: "")
          case .about:
            return NSLocalizedString("55", comment: "عن التطبيق")
          case .settt:
            return NSLocalizedString("56", comment: "الإعدادات")
          }
        }

    var imageName: String {
      switch self {
      case .home:
        return "house"
      case .info:
        return "xmark.octagon"
      case .appRating:
        return "house.circle.fill"
      case .shareApp:
        return "person.fill.xmark"
      case .settings:
        return "phone"
      case .centers:
        return "location.fill"
      case .dark:
        return "moon"
      case .language:
        return "character"
      case .about:
        return "lanyardcard"
      case .settt:
        return "gear"
      }
    }
  }
  var switchController: UISwitch!
  private let tableView: UITableView = {
    let table = UITableView()
    table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
      table.backgroundColor = .systemMint
    return table
  }()
  override func viewDidLoad() {
    super.viewDidLoad()

    view.addSubview(tableView)
    tableView.delegate = self
    tableView.dataSource = self
    view.backgroundColor = .systemGray6
    title = NSLocalizedString("31", comment:"الصفحه الرئيسية")
    // Do any additional setup after loading the view.
  }
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    tableView.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.bounds.size.width, height: view.bounds.size.height)
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return MenuOPtions.allCases.count
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.textLabel?.text = MenuOPtions.allCases[indexPath.row].localized
    cell.textLabel?.textColor = .white
    cell.imageView?.image = UIImage(systemName: MenuOPtions.allCases[indexPath.row].imageName)
      cell.imageView?.tintColor = .systemGray6
      cell.backgroundColor = .white
      cell.contentView.backgroundColor = .systemGray4
      if cell.isSelected == true {
        cell.contentView.backgroundColor = .yellow
      } else if cell.isSelected == false{
          cell.contentView.backgroundColor = .systemGray3
      }
    cell.selectionStyle = .blue
    return cell
  }
   func setSelected(_ selected: Bool, animated: Bool) {
    setSelected(selected, animated: animated)
    if selected {
      // visual updates (with a small animation)
    } else {
      // visual updates
    }
  }
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    let item = MenuOPtions.allCases[indexPath.row]
    delegate?.didSelect(menuItem: item)
    let selectedCell:UITableViewCell = tableView.cellForRow(at: indexPath)!
       selectedCell.contentView.backgroundColor = .gray
  } 
}
