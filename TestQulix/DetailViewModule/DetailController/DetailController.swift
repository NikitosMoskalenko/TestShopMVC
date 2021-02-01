//
//  DetailController.swift
//  TestQulix
//
//  Created by Nikita Moskalenko on 1/31/21.
//

import UIKit


class DetailController: UIViewController {
    
    var model: DetailModelProtocol?
    var detailView: DetailViewInput?
    var productID = ""
    
    override func loadView() {
        self.view = detailView as? UIView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailView?.createVIew()
        getDetailData()
    }
    
    private func getDetailData() {
        detailView?.setActivityStatus(status: .start)
        RequestManager.shared.getDetailInfoProductWithID(productID) { [weak self] (detailData) in
            guard let self = self else { return }
            self.model?.detailData = detailData
            self.detailView?.setData(self.model as! DetailModelProtocol)
            self.detailView?.setActivityStatus(status: .stop)
        }
    }
    
}

extension DetailController: DetailViewOutput {
    
}
