//
//  Order.swift
//  HookahProject
//
//  Created by Ацамаз Бицоев on 27.02.2020.
//  Copyright © 2020 Ацамаз Бицоев. All rights reserved.
//

import Foundation


struct Order {
    
    var id: Int? = nil
    var number: String? = nil
    var customerCount: Int
    var options: [OrderOption]
    var dateTime: Int?
    var orderStatus: OrderStatus?
    
}


enum OrderStatus: Int {
    
    case waiting = 1
    case approved = 2
    case denied = 3
    
}
