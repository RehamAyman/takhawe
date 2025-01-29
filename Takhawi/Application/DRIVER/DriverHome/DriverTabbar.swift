////
////  DriverTabbar.swift
////  Takhawi
////
////  Created by Reham Ayman on 10/02/2024.
////
//
import UIKit


class DriverTabbar: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.items?[0].title = "Home".localized
        tabBar.items?[1].title = "Notifications".localized
        tabBar.items?[2].title = "More".localized
        self.tabBar.unselectedItemTintColor = UIColor.white
        self.tabBar.tintColor = UIColor(named: "tabbarSelection")
        self.changeTabbarRadius()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let items = tabBar.items {
            for item in items {
                item.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.changeHeight()
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        item.image?.withRenderingMode(.alwaysOriginal)
        self.SimpleAnnimationWhenSelectItem(item)
    }
    
    func changeTabbarRadius() {
        self.tabBar.layer.masksToBounds = true
        self.tabBar.isTranslucent = false // No transparency
        self.tabBar.layer.cornerRadius = 30
        self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        self.tabBar.barTintColor = UIColor(named: "MainColor") // Set your desired color
    }
    
    func changeHeight() {
        if UIDevice().userInterfaceIdiom == .phone {
            var tabFrame = tabBar.frame
            tabFrame.size.height = 100
            tabFrame.origin.y = view.frame.size.height - 100
            tabBar.frame = tabFrame
        }
    }
    
    func SimpleAnnimationWhenSelectItem(_ item: UITabBarItem) {
        guard let barItemView = item.value(forKey: "view") as? UIView else { return }
        let timeInterval: TimeInterval = 0.4
        let propertyAnimator = UIViewPropertyAnimator(duration: timeInterval, dampingRatio: 0.5) {
            barItemView.transform = CGAffineTransform.identity.scaledBy(x: 1.3, y: 1.3)
        }
        propertyAnimator.addAnimations({ barItemView.transform = .identity }, delayFactor: CGFloat(timeInterval))
        propertyAnimator.startAnimation()
    }
}
