//
//  CustomTableViewCell.swift
//  RedPanda
//
//  Created by Muhammad Anas on 25/10/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

 //   @IBOutlet weak var lblTitle: UILabel!
 //   @IBOutlet weak var lblSubTitle: UILabel!
    
    var dataViewModel = DataViewModel()
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productDesc: UILabel!
        
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        dataViewModel.SetupImageView(myImageView: productImage, cornerRadius: 12.0, shadowOpacity: 0.2)
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let contentViewFrame = self.contentView.frame
        let insetContentViewFrame = contentViewFrame.insetBy(dx: 4.0, dy: 4.0)
        self.contentView.layer.cornerRadius = 8.0
           self.contentView.frame = insetContentViewFrame
           self.selectedBackgroundView?.frame = insetContentViewFrame
        


        
        
        
        //contentView.frame = UiRect(top: 10, left: 10, bottom: 10, right: 10)
        


        
    }
    
    
}
