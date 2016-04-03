//
//  Product.swift
//  eSubzi
//
//  Created by Robin Malhotra on 04/04/16.
//  Copyright © 2016 Robin Malhotra. All rights reserved.
//

import UIKit
import SwiftyJSON
class Product: NSObject
{
    var price : Float = 0.0
    var quantity : Int = 0
    var image = UIImage()
    var userId = ""
    var itemDescription = ""
    var discount:Float = 0.0
    var id = ""
    init(jsonDict : JSON)
    {
        guard let id = jsonDict["__id"].string, quantity = jsonDict["quantity"].int, price = jsonDict["price"].float
        else
        {
            return
        }
        self.id = id
        self.quantity = quantity
        self.price = price
        
    }
}
