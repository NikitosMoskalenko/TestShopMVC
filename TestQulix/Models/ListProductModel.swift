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
    
    let productID: String
    let name: String
    let price: Int
    let image: String

    enum CodingKeys: String, CodingKey {
        case productID = "product_id"
        case name, price, image
    }
}

