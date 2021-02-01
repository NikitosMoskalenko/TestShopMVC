//
//  DetailModel.swift
//  TestQulix
//
//  Created by Nikita Moskalenko on 1/31/21.
//

import Foundation

 // MARK: - DetailModelProtocol

protocol DetailModelProtocol: Any {
    var detailData: ProductsDetailModel? { get set }
}

 // MARK: - DetailModel

struct DetailModel: DetailModelProtocol {
    
    var detailData: ProductsDetailModel?
    
}

