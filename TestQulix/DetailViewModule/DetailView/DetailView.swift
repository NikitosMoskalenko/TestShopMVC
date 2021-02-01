//
//  DetailView.swift
//  TestQulix
//
//  Created by Nikita Moskalenko on 1/31/21.
//

import UIKit

// MARK: - DetailViewInput

protocol DetailViewInput: AnyObject {
    func createVIew()
    func setActivityStatus(status: ActivityIndicatorActionStatus)
    func setData(_ data: DetailModelProtocol)
}

// MARK: - DetailViewOutput

protocol DetailViewOutput: AnyObject {
}

// MARK: - DetailView

final class DetailView: UIView {
    
    // MARK: - controller
    
    weak var controller: DetailViewOutput!
    
    lazy var prodImageView = UIImageView()
    lazy var prodTitle = UILabel()
    lazy var prodPrice = UILabel()
    lazy var prodDescription = UILabel()
    private lazy var activityIndicator = UIActivityIndicatorView()
    private var imageCache = NSCache<NSString, UIImage>()
    
    private func activitySetup(status: ActivityIndicatorActionStatus) {
        switch status {
        case .start:
            activityIndicator.isHidden = false
            activityIndicator.startAnimating()
        case .stop:
            activityIndicator.isHidden = true
            activityIndicator.stopAnimating()
            self.setNeedsLayout()
        }
    }
    
    private func createProdImageView() {
        createImageView(prodImageView)
    }
    
    private func createProdTitle() {
        createTitleLabel(prodTitle, imageView: prodImageView)
    }
    
    private func createProdPrice() {
        createPriceLabel(prodPrice, titleLabel: prodTitle)
    }
    
    private func createDescriptionLabel() {
        createDescriptionLabel(prodDescription, priceLabel: prodPrice)
    }
    
    private func setDataTo(data: DetailModelProtocol) {
        guard data.detailData?.image != nil,
              let price = data.detailData?.price else { return }
        prodImageView.image = CacheManager.shared.cacheImage(urlString: (data.detailData?.image)!, cachedImage: imageCache)
        prodTitle.text = data.detailData?.name
        prodPrice.text = "\(price) $"
        prodDescription.text = data.detailData?.description
    }
    
}

extension DetailView: DetailViewInput {
    
    func setActivityStatus(status: ActivityIndicatorActionStatus) {
        activitySetup(status: status)
    }
    
    func createVIew() {
        createProdImageView()
        createProdTitle()
        createProdPrice()
        createDescriptionLabel()
    }
    
    func setData(_ data: DetailModelProtocol) {
        setDataTo(data: data)
    }
    
}
