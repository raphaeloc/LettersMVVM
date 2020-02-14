//
//  AppDelegate.swift
//  LettersMVVM
//
//  Created by Raphael Oliveira Chagas on 11/02/20.
//  Copyright © 2020 Raphael Oliveira Chagas. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let navigationController = UINavigationController()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

        let coordinator = SplashCoordinator(navigationController: navigationController)
        coordinator.start(with: .push(animated: true))
        
        return true
    }
}

