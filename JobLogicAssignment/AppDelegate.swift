//
//  AppDelegate.swift
//  JobLogicAssignment
//
//  Created by chungmh on 08/07/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        UIApplication.shared.statusBarStyle = .lightContent
        
        let viewController = JHMenuRouter.assumbleModule()
        let navigationVC = UINavigationController.init(rootViewController: viewController)
        navigationVC.defaultNavigationBarStyle()
        
        self.window?.rootViewController = navigationVC
        self.window?.makeKeyAndVisible()
        return true
    }
    
}

