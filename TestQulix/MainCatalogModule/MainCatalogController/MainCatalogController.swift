//
//  MainCatalogController.swift
//  TestQulix
//
//  Created by Nikita Moskalenko on 1/31/21.
//

import UIKit

// MARK: - MainCatalogController

class MainCatalogController: UIViewController {
    
    var model: MaiNCatalogModelProtocol?
    var productsList: [ProductsModel] = []
    var mainCatalogView: MainCatalogViewInput?
    var coordinator: CoordinatorProtocol?
    
    // MARK: - Life cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData()
        mainCatalogView?.createTopView()
        mainCatalogView?.createTableView()
        mainCatalogView?.createActivityIndicator()
        mainCatalogView?.createLogoImage()
    }
    
    override func loadView() {
        self.view = mainCatalogView as? UIView
    }
    
    private func getData() {
        mainCatalogView?.checkActiviry(status: .start)
        RequestManager.shared.getProductsList { [weak self] (data) in
            guard let self = self,
                  data != nil else {
                return }
            self.productsList.append(contentsOf: (data!.products))
            self.mainCatalogView?.checkActiviry(status: .stop)
        }
    }
    
}

extension MainCatalogController: MainCatalogViewOutput {
    func didSelectRowAtIndexPath(_ indexPath: IndexPath) {
        let productID = productsList[indexPath.row].productID
        coordinator?.toDetailController(productID: productID)
    }
}
