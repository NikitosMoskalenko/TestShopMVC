//
//  CatalogCellExtension.swift
//  TestQulix
//
//  Created by Nikita Moskalenko on 1/31/21.
//

import UIKit

extension CatalogCell {
    
    func createImageView(_ imageView: UIImageView) {
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imageView)
        imageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 6).isActive = true
    }
    
    func createTitleLabel(_ titleLabel: UILabel, imageView: UIImageView) {
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 22)
        titleLabel.textColor = .black
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: imageView.centerYAnchor, constant: 0).isActive = true
    }
    
    func createPriceLabel(_ pricaLabel: UILabel, titleLabel: UILabel) {
        pricaLabel.numberOfLines = 0
        pricaLabel.font = UIFont.boldSystemFont(ofSize: 20)
        pricaLabel.textColor = .black
        pricaLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(pricaLabel)
        pricaLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        pricaLabel.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor, constant: 0).isActive = true
    }
    
}
