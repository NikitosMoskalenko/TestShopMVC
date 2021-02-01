//
//  AppDelegate.swift
//  TestQulix
//
//  Created by Nikita Moskalenko on 1/31/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // MARK: Public properties

    var window: UIWindow?
    var coordinator: CoordinatorProtocol?
    
    // MARK: Public methods

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController()
        
        coordinator = Coordinator(navigationController: navigationController, window: window)
        coordinator?.start()
        
        return true
    }
}

