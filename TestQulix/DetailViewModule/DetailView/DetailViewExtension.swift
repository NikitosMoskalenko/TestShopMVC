//
//  DetailViewExtension.swift
//  TestQulix
//
//  Created by Nikita Moskalenko on 2/1/21.
//

import UIKit

extension DetailView {
    
    func createImageView(_ imageView: UIImageView) {
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 150).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
    }
    
    func createTitleLabel(_ titleLabel: UILabel, imageView: UIImageView) {
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 22)
        titleLabel.textColor = .black
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor, constant: 0).isActive = true
    }
    
    func createPriceLabel(_ priceLabel: UILabel, titleLabel: UILabel) {
        priceLabel.numberOfLines = 0
        priceLabel.textAlignment = .center
        priceLabel.font = UIFont.italicSystemFont(ofSize: 20)
        priceLabel.textColor = .black
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(priceLabel)
        priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        priceLabel.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor, constant: 0).isActive = true
    }
    
    func createDescriptionLabel(_ descriptionLabel: UILabel, priceLabel: UILabel) {
        descriptionLabel.numberOfLines = 0
        descriptionLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        descriptionLabel.textAlignment = .center
        descriptionLabel.font = UIFont.italicSystemFont(ofSize: 20)
        descriptionLabel.textColor = .black
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(descriptionLabel)
        descriptionLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 10).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30).isActive = true
    }
}
