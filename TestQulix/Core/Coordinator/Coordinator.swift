//
//  Coordinator.swift
//  TestQulix
//
//  Created by Nikita Moskalenko on 1/31/21.
//

import UIKit

// MARK: - CoordinatorProtocol

protocol CoordinatorProtocol {
    func start()
    func toDetailController(productID: String)
}

// MARK: - Coordinator

final class Coordinator: CoordinatorProtocol {
    
    // MARK: Public properties
    
    var navigationController: UINavigationController
    var window: UIWindow?
    
    // MARK: - Init
    
    init(navigationController: UINavigationController, window: UIWindow?) {
        self.navigationController = navigationController
        self.window = window
        
        setWindow()
    }
    
    func start() {
        goToCatalogCollectionView()
    }
    
    func toDetailController(productID: String) {
        goTodetailController(productID: productID)
    }
    
    // MARK: - Private methods
    
    private func goToCatalogCollectionView() {
        let catalog = Builder.createMainCatalogController(coordinator: self)
        pushViewController(catalog, animated: true)
    }
    
    private func goTodetailController(productID: String) {
        let detail = Builder.createDeteailViewController(coordinator: self, productID: productID)
        pushViewController(detail, animated: true)
    }
    
    private func pushViewController(_ viewController: UIViewController, animated: Bool) {
        navigationController.pushViewController(viewController, animated: animated)
        navigationController.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController.navigationBar.shadowImage = UIImage()
        navigationController.navigationBar.isTranslucent = true
        navigationController.view.backgroundColor = UIColor.clear
    }
    
    
    private func setWindow() {
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        window?.overrideUserInterfaceStyle = .light
        window?.backgroundColor = .white
    }
    
}
