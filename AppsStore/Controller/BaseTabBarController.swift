//
//  BaseTabBarController.swift
//  AppsStore
//
//  Created by Владислав Резник on 20.06.2022.
//

import UIKit

class BaseTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [
            createNavController(viewController: TodayController(), title: "Today", imageName: "burst.fill"),
            createNavController(viewController: AppsPageController(), title: "Apps", imageName: "apps.iphone"),
            createNavController(viewController: AppsSearchController(), title: "Search", imageName: "magnifyingglass")
        ]
        
        self.tabBar.standardAppearance = setTabBarAppearance(color: .init(white: 0.96, alpha: 1))
        self.tabBar.scrollEdgeAppearance = setTabBarAppearance(color: .init(white: 0.96, alpha: 1))
    }
    
    fileprivate func createNavController(viewController: UIViewController, title: String, imageName: String) -> UIViewController {
        viewController.tabBarController?.tabBar.standardAppearance = setTabBarAppearance(color: .green)
        let navController = UINavigationController(rootViewController: viewController)
        navController.navigationBar.prefersLargeTitles = true
        
        viewController.navigationItem.title = title
        
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(systemName: imageName)
        
        navController.navigationBar.standardAppearance = setNavigationBarAppearance(color: .init(white: 0.96, alpha: 1))
        navController.navigationBar.scrollEdgeAppearance = setNavigationBarAppearance(color: .init(white: 0.96, alpha: 1))
   
        viewController.view.backgroundColor = .white
        return navController
    }
    
    fileprivate func setNavigationBarAppearance(color: UIColor) -> UINavigationBarAppearance {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = color
        return appearance
    }
    
    fileprivate func setTabBarAppearance(color: UIColor) -> UITabBarAppearance {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = color
        return appearance
    }
}
