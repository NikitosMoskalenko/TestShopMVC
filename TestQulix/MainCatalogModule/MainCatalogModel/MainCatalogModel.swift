//
//  MainCatalogModel.swift
//  TestQulix
//
//  Created by Nikita Moskalenko on 1/31/21.
//

import Foundation

// MARK: - MaiNCatalogModelProtocol

protocol MaiNCatalogModelProtocol {
    var data: ListProductsModelProtocol? { get set }
}

// MARK: - MaiNCatalogModel

struct MaiNCatalogModel: MaiNCatalogModelProtocol {
    var data: ListProductsModelProtocol?
}
