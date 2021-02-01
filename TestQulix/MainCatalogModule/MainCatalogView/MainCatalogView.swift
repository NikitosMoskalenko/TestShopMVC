//
//  MainCatalogView.swift
//  TestQulix
//
//  Created by Nikita Moskalenko on 1/31/21.
//

import UIKit

// MARK: - ActivityIndicatorActionStatus

enum ActivityIndicatorActionStatus {
    case start
    case stop
}

// MARK: - MainCatalogViewInput

protocol MainCatalogViewInput: AnyObject {

    func createTopView()
    func createLogoImage() 
    func createTableView()
    func createActivityIndicator()
    func checkActiviry(status: ActivityIndicatorActionStatus)
}

// MARK: - MainCatalogViewOutput

protocol MainCatalogViewOutput: AnyObject {
    var productsList: [ProductsModel] { get set }
    
    func didSelectRowAtIndexPath(_ indexPath: IndexPath)
}

 // MARK: - MainCatalogView

final class MainCatalogView: UIView {
    
    weak var controller: MainCatalogViewOutput!
    
    private lazy var logoImage = UIImageView()
    private lazy var topView = UIView()
    private lazy var tableView = UITableView()
    private lazy var activityIndicator = UIActivityIndicatorView()
    
    
    private func activitySetup(status: ActivityIndicatorActionStatus) {
        switch status {
        case .start:
            activityIndicator.isHidden = false
            activityIndicator.startAnimating()
        case .stop:
            activityIndicator.isHidden = true
            activityIndicator.stopAnimating()
            tableView.reloadData()
        }
    }
    
}

extension MainCatalogView: MainCatalogViewInput {
    
    func createTopView() {
        createTopView(topView)
    }
    
    func createLogoImage() {
        createLogoImageView(logoImage, topView: topView)
    }
    
    func createTableView() {
        createTableView(tableView, topView: topView)
    }
    
    func createActivityIndicator() {
        makeActivityIndicator(activityIndicator: activityIndicator)
    }
    
    func checkActiviry(status: ActivityIndicatorActionStatus) {
        activitySetup(status: status)
    }
    
}

extension MainCatalogView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return controller.productsList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CatalogCell.SelfIdentifire()) as? CatalogCell else {
            
            return UITableViewCell()
        }
        
        cell.backgroundColor = .clear
        cell.contentView.backgroundColor = .clear
        cell.index = indexPath.row
        cell.data = controller.productsList[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        controller.didSelectRowAtIndexPath(indexPath)
    }
    
}
