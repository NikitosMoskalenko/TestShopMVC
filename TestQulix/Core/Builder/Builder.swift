//
//  Builder.swift
//  TestQulix
//
//  Created by Nikita Moskalenko on 1/31/21.
//

import Foundation

// MARK: - BuilderProtocol

protocol BuilderProtocol: class {
    
    static func createMainCatalogController(coordinator: CoordinatorProtocol) -> MainCatalogController
    static func createDeteailViewController(coordinator: CoordinatorProtocol, productID: String) -> DetailController
}

// MARK: - Builder

final class Builder: BuilderProtocol {
    
    static func createMainCatalogController(coordinator: CoordinatorProtocol) -> MainCatalogController {
        let controller = MainCatalogController()
        let mainCatalogModel = MaiNCatalogModel()
        let view = MainCatalogView()
        view.controller = controller
        controller.mainCatalogView = view
        controller.model = mainCatalogModel
        controller.coordinator = coordinator
        
        return controller
    }
    
    static func createDeteailViewController(coordinator: CoordinatorProtocol, productID: String) -> DetailController {
        let controller = DetailController()
        let detailModel = DetailModel()
        let view = DetailView()
        view.controller = controller
        controller.detailView = view
        controller.model = detailModel
        controller.productID = productID
        
        return controller
    }
    
}
