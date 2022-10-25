//
//  DataViewModel.swift
//  RedPanda
//
//  Created by Muhammad Anas on 25/10/22.
//


import UIKit

class DataViewModel {
    
    var datas: [Data] = [Data]()
    var reloadTableView: (()->())?
    var showError: (()->())?
    var showLoading: (()->())?
    var hideLoading: (()->())?
    
    private var cellViewModels: [DataListCellViewModel] = [DataListCellViewModel]() {
        didSet {
            self.reloadTableView?()
        }
    }
    
    func getData(){
        showLoading?()
        ApiClient.getDataFromServer { (success, data) in
            self.hideLoading?()
            if success {
                self.createCell(datas: data!)
                self.reloadTableView?()
            } else {
                self.showError?()
            }
        }
    }
    
    var numberOfCells: Int {
        return cellViewModels.count
    }
    
    func getCellViewModel( at indexPath: IndexPath ) -> DataListCellViewModel {
        return cellViewModels[indexPath.row]
    }
    
    func createCell(datas: [Data]){
        self.datas = datas
        var vms = [DataListCellViewModel]()
        for data in datas {
            //vms.append(DataListCellViewModel(titleText: data.title, subTitleText: data.subTitle))
            vms.append(DataListCellViewModel(imageURL: data.productTitle, productTitle: data.productTitle, productPrice: data.productPrice, productDesc: data.productDesc))
        }
        cellViewModels = vms
    }
    
    func SetupImageView(myImageView:UIImageView , cornerRadius:CGFloat , shadowOpacity: Float){

        myImageView.layer.shadowColor = UIColor.black.cgColor
        myImageView.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        myImageView.layer.shadowOpacity = shadowOpacity
        myImageView.layer.shadowRadius = cornerRadius
        myImageView.layer.cornerRadius = cornerRadius
    }
    
}

struct DataListCellViewModel {
    
    let imageURL: String
    let productTitle: String
    let productPrice: Int
    let productDesc: String
    
    
//    let titleText: String
 //   let subTitleText: String
}
