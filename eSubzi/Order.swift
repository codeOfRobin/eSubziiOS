//
//  Order.swift
//  eSubzi
//
//  Created by Robin Malhotra on 04/04/16.
//  Copyright © 2016 Robin Malhotra. All rights reserved.
//

import UIKit
enum orderState {
    case haventOrdered,InProgress,
    Delivered
}

class currentOrder: NSObject
{
    var userId = ""
    var orders : [String:Int] = [:]
    var currentOrderState = orderState.haventOrdered
}
let sharedCurrentOrder = currentOrder()