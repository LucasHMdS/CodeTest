//
//  AppDelegate.swift
//  PixelTMDb
//
//  Created by Lucas Henrique Machado Da Silva on 18/09/19.
//  Copyright © 2019 Lucas Henrique Machado da Silva. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupRootWindow()
        
        return true
    }
}

extension AppDelegate {
    private func setupRootWindow() {
        let mainViewModel = MainViewModel()
        let mainViewController = MainViewController()
        mainViewController.viewModel = mainViewModel
        let navigationController = UINavigationController()
        navigationController.viewControllers = [mainViewController]
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = navigationController
    }
}
