//
//  ListProductModel.swift
//  TestQulix
//
//  Created by Nikita Moskalenko on 1/31/21.
//


import Foundation

// MARK: - ListProductsModelProtocol

protocol ListProductsModelProtocol {
    var products: [ProductsModel] { get set }
}

// MARK: - ListProductsModel

struct ListProductsModel: Codable, ListProductsModelProtocol {
    
    var products: [ProductsModel]

}

// MARK: - ProductsModel

struct ProductsModel: Codable {
    
    var productID: String
    var name: String
    var price: Int
    var image: String

    enum CodingKeys: String, CodingKey {
        case productID = "product_id"
        case name, price, image
    }
}

