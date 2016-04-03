//
//  ProductTableViewCell.swift
//  eSubzi
//
//  Created by Robin Malhotra on 04/04/16.
//  Copyright © 2016 Robin Malhotra. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemPrice: UILabel!
    @IBOutlet weak var itemQuantity: UILabel!
    @IBAction func incQuantity(sender: AnyObject)
    {
    
    }
    @IBAction func decreaseQuantity(sender: AnyObject)
    {
    
    }
    
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setDataFromProduct(prod: Product)
    {
        itemNameLabel.text = prod.itemDescription
        itemPrice.text = String(prod.price)
        itemQuantity.text = String(prod.quantity)
        itemImageView.image = prod.image
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
