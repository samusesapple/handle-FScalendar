//
//  ContainerViewController.swift
//  TeamProject
//
//  Created by Sam Sung on 2023/03/29.
//

import UIKit

final class ContainerViewController: UIViewController {
    
    private enum MenuState {
        case opened
        case closed
    }
    
    private var menuState: MenuState = .closed
    
    private let monthlyVC = MonthlyViewController()
    private let menuVC = MenuViewController()
    private var navVC: UINavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addChildVC()
    }
    
    
    private func addChildVC() {
        addChild(menuVC)
        view.addSubview(menuVC.view)
        menuVC.didMove(toParent: self)
        
        monthlyVC.delegate = self
        let navVC = UINavigationController(rootViewController: monthlyVC)
        addChild(navVC)
        view.addSubview(navVC.view)
        navVC.didMove(toParent: self)
        self.navVC = navVC
    }
    
    
}

extension ContainerViewController: MonthlyViewControllerDelegate {
    func didTapMenuButton() {
        switch menuState {
        case .closed:
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut) {
                self.navVC?.view.frame.origin.x = self.monthlyVC.view.anchorPoint.x - 290
                self.monthlyVC.topStackView.menuButton.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
            } completion: { [weak self] done in
                if done {
                    self?.menuState = .opened
                }
            }
            
        case .opened:
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut) {
                self.navVC?.view.frame.origin.x = 0
                self.monthlyVC.topStackView.menuButton.setImage(UIImage(systemName: "text.justify"), for: .normal)
            } completion: { done in
                if done {
                    self.menuState = .closed
                }
            }
            
            
        }
        
    }
    
    
    
    
}
