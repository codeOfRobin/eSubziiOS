//
//  ProductTableViewCell.swift
//  eSubzi
//
//  Created by Robin Malhotra on 04/04/16.
//  Copyright © 2016 Robin Malhotra. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell
{
    var productObj : Product?
    @IBOutlet var itemNameLabel: UILabel!
    @IBOutlet var itemImageView: UIImageView!
    @IBOutlet var itemPrice: UILabel!
    @IBOutlet var itemQuantity: UILabel!
    @IBAction func incQuantity(sender: AnyObject)
    {
        guard (itemQuantity.text!) != ""
        else
        {
            return
        }
        if sharedCurrentOrder.orders.keys.contains((productObj?.id)!)
        {
            if sharedCurrentOrder.orders[(productObj?.id)!] < productObj?.quantity
            {
                sharedCurrentOrder.orders[(productObj?.id)!]! += 1
            }
            
        }
        else
        {
            sharedCurrentOrder.orders[(productObj?.id)!] = 1
        }
        itemQuantity.text = String(sharedCurrentOrder.orders[(productObj?.id)!])
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
        productObj = prod
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
