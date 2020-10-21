//
//  ProductsCell.swift
//  CASHU
//
//  Created by Smart Zone on 10/20/20.
//  Copyright © 2020 Smart Zone. All rights reserved.
//

import UIKit

class ProductsCell: UITableViewCell {

    //MARK:- Outlets
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupProducts(product: Products){
        var imageURL = ""
        if let link = product.links{
            if link.count > 0{
                imageURL = link[0].link
            }
        }
        productImage.layer.cornerRadius = 10
        productImage.clipsToBounds = true
        SetImageWithPlaceholder.setImage(imageURL, placeholder: "Launch", myImage: productImage)
        productName.text = product.name_en
    }
    
}
