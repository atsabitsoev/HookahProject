//
//  OrderCreatingOrderVC.swift
//  HookahProject
//
//  Created by Ацамаз Бицоев on 26.02.2020.
//  Copyright © 2020 Ацамаз Бицоев. All rights reserved.
//

import UIKit

class OrderCreatingOrderVC: UIViewController {
    
    
    var configuration: OrderCreatingOrderConfiguration?
    var order: Order?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        configuration = OrderCreatingOrderConfiguration(maxCustomerCount: 5,
                                                        availableOptions: [OrderOption(id: 1, name: "У окна"),
                                                                           OrderOption(id: 2, name: "Мягкие сидения"),
                                                                           OrderOption(id: 3, name: "Близко к туалету")],
                                                        availableDates: [],
                                                        availableTimes: [])
        order = Order(customerCount: 1, optionIds: [], dateTime: nil)
    }

}


extension OrderCreatingOrderVC: OCOCustomerCountCellDelegate {
    
    func customerCountChanged(to count: Int) {
        order?.customerCount = count
    }
    
}


extension OrderCreatingOrderVC: OCOOrderOptionCellDelegate {
    
    func addOption(id: Int) {
        order?.optionIds.append(id)
        print(order!.optionIds)
    }
    
    func deleteOption(id: Int) {
        guard let indexOfOption = order?.optionIds.firstIndex(of: id) else { return }
        order?.optionIds.remove(at: indexOfOption)
        print(order!.optionIds)
    }
    
}
