//
//  ContainerViewController.swift
//  EsayFlight
//
//  Created by sara al zhrani on 05/05/1443 AH.
//
import UIKit


class ContainerViewController: UIViewController {
  enum MenuState {
    case opend
    case closed
  }
  private var menuState: MenuState = .closed
  let menuVC = MenuViewController()
  let homeVC = profiel()
  var navVC: UINavigationController?
  lazy var infoVC = Home()
  lazy var settin = AskForHelp()
  lazy var list = CallUsVC()
  lazy var car = CarRent()
  lazy var center = Location()
  override func viewDidLoad() {
    super.viewDidLoad()
      
    view.backgroundColor = .gray
    addChildVCs()
  }
  private func addChildVCs() {
    menuVC.delegate = self
    addChild(menuVC)
    view.addSubview(menuVC.view)
    menuVC.didMove(toParent: self)
      profiel().delegate = self
      
    let navVC = UINavigationController(rootViewController: profiel())
    addChild(navVC)
    view.addSubview(navVC.view)
    navVC.didMove(toParent: self)
    self.navVC = navVC
  }
}
extension ContainerViewController: HomeViewControllerDelegate{
    
  func didTapMenuButton() {
    toggleMenu(completion: nil)
      print("tapp is active2 ")
  }
    
  func toggleMenu(completion: (() -> Void)?) {
    switch menuState {
    case .closed:
      UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .transitionFlipFromRight) {
        self.navVC?.view.frame.origin.x = self.homeVC.view.frame.size.width-100
      } completion: { [weak self] done in
        if done {
          self?.menuState = .opend
        }
      }
    case .opend:
      UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .transitionFlipFromRight) {
        self.navVC?.view.frame.origin.x = 0
      } completion: { [weak self] done in
        if done {
          self?.menuState = .closed
          DispatchQueue.main.async {
            completion?()
          }
        }
      }
    }
  }
}
extension ContainerViewController: MenuViewControllerDelegate{
  func didSelect(menuItem: MenuViewController.MenuOPtions) {
    toggleMenu(completion: nil)
    switch menuItem {
    case .home:
      self.resetToHome()
    case .info:
      self.addInfo()
    case .appRating:
      self.addcity()
    case .shareApp:
      self.addlist()
    case .settings:
      self.addSet()
    case .centers:
      self.addCen()
    case .dark:
      self.addCen()
    case .language:
      self.changrLan()
    case .about:
      self.addCen()
    case .settt:
      self.addCen()
    }
  }
  func addInfo() {
    let vc = infoVC
    homeVC.addChild(vc)
    homeVC.view.addSubview(vc.view)
    vc.view.frame = view.frame
    vc.didMove(toParent: homeVC)
    homeVC.title = vc.title
  }
  func darkk() {
    let appDelegate = UIApplication.shared.windows.first
    appDelegate?.backgroundColor = .black
  }
  func addcity() {
    let vc = car
    homeVC.addChild(vc)
    homeVC.view.addSubview(vc.view)
    vc.view.frame = view.frame
    vc.didMove(toParent: homeVC)
    homeVC.title = vc.title
  }
  func addSet() {
    let vc = settin
    homeVC.addChild(vc)
    homeVC.view.addSubview(vc.view)
    vc.view.frame = view.frame
    vc.didMove(toParent: homeVC)
    homeVC.title = vc.title
  }
  func addlist() {
    let vc = list
    homeVC.addChild(vc)
    homeVC.view.addSubview(vc.view)
    vc.view.frame = view.frame
    vc.didMove(toParent: homeVC)
    homeVC.title = vc.title
  }
  func addCen() {
    let vc = center
    homeVC.addChild(vc)
    homeVC.view.addSubview(vc.view)
    vc.view.frame = view.frame
    vc.didMove(toParent: homeVC)
    homeVC.title = vc.title
  }
  func resetToHome() {
    infoVC.view.removeFromSuperview()
    settin.view.removeFromSuperview()
      car.view.removeFromSuperview()
    list.view.removeFromSuperview()
    center.view.removeFromSuperview()
    infoVC.didMove(toParent: nil)
    homeVC.title = NSLocalizedString("", comment:"الصفحه الرئيسية")
  }
  func changrLan() {
    let currentLa = Locale.current.languageCode
    let newLan = currentLa == "en" ? "ar" : "en"
    UserDefaults.standard.setValue([newLan], forKey: "AppleLanguages")
    exit(0)
  }
}
