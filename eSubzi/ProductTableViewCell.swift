//
//  ProductTableViewCell.swift
//  eSubzi
//
//  Created by Robin Malhotra on 04/04/16.
//  Copyright © 2016 Robin Malhotra. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet var itemNameLabel: UILabel!
    @IBOutlet var itemImageView: UIImageView!
    @IBOutlet var itemPrice: UILabel!
    @IBOutlet var itemQuantity: UILabel!
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
        print(prod.itemDescription)
        
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
