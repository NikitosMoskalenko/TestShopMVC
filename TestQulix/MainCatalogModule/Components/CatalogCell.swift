//
//  CatalogCell.swift
//  TestQulix
//
//  Created by Nikita Moskalenko on 1/31/21.
//

import UIKit

// MARK: - CatalogCell

final class CatalogCell: UITableViewCell {
    
    // MARK: - Data
    
    var data: ProductsModel? {
        didSet {
            updateUI()
        }
    }
    
    var index = 0
    private var imageCache = NSCache<NSString, UIImage>()
    
    // MARK: - Private properties
    
    private lazy var prodImageView = UIImageView()
    private lazy var titleLabel = UILabel()
    private lazy var priceLabel = UILabel()
    
    // MARK: - Life cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        createImageView(prodImageView)
        createTitleLabel(titleLabel, imageView: prodImageView)
        createPriceLabel(priceLabel, titleLabel: titleLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public methods
    
    static func SelfIdentifire() -> String {
        return String(describing: self)
    }
    
    // MARK: - Private methods
    
    private func updateUI() {
        guard let imgURLString = data?.image,
              let price = data?.price else {
            return
        }
        prodImageView.image = CacheManager.shared.cacheImage(urlString: imgURLString, cachedImage: imageCache)
        titleLabel.text = data?.name
        priceLabel.text = "\(price) $"
    }
    
}
