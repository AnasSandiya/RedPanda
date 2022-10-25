//
//  Data.swift
//  RedPanda
//
//  Created by Muhammad Anas on 25/10/22.
//


import Foundation

class Data {
    
    var imageURL: String
    var productTitle: String
    var productPrice: Int
    var productDesc: String
    
 //   var title: String
 //   var subTitle: String
    
//    init(title: String, subTitle: String) {
//        self.title = title
//        self.subTitle = subTitle
//    }
    
    init(imageURL: String,productTitle: String,productPrice: Int,productDesc: String) {
        self.imageURL = imageURL
        self.productTitle = productTitle
        self.productPrice = productPrice
        self.productDesc = productDesc
    }
}
