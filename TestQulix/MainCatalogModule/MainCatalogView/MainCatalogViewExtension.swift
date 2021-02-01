//
//  MainCatalogViewExtension.swift
//  TestQulix
//
//  Created by Nikita Moskalenko on 1/31/21.
//

import UIKit

extension MainCatalogView {
    
    func createTopView(_ topView: UIView){
        topView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(topView)
        topView.heightAnchor.constraint(equalToConstant: 270).isActive = true
        topView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        topView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        topView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
    }
    
    func createLogoImageView(_ logoImageView: UIImageView, topView: UIView) {
        logoImageView.image = UIImage(named: "logo")
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        topView.addSubview(logoImageView)
        logoImageView.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 0).isActive = true
        logoImageView.topAnchor.constraint(equalTo: topView.topAnchor, constant: 0).isActive = true
        logoImageView.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: 0).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 270).isActive = true
    }
    
    func createTableView(_ tableView: UITableView, topView: UIView) {
        tableView.backgroundColor = .white
        tableView.register(CatalogCell.self, forCellReuseIdentifier: CatalogCell.SelfIdentifire())
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.clipsToBounds = true
        tableView.layer.cornerRadius = 20
        tableView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        tableView.delegate = self
        tableView.dataSource = self
        addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: -20).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
    }
    
    func makeActivityIndicator(activityIndicator: UIActivityIndicatorView)  {
        activityIndicator.color = .gray
        activityIndicator.hidesWhenStopped = true
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        addSubview(activityIndicator)
        activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
}
