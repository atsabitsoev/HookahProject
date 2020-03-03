//
//  OrderCreatingOrderVC.swift
//  HookahProject
//
//  Created by Ацамаз Бицоев on 26.02.2020.
//  Copyright © 2020 Ацамаз Бицоев. All rights reserved.
//

import UIKit

class OrderCreatingOrderVC: UIViewController {
    
    
    //MARK: UI Elements
    @IBOutlet weak var tableView: UITableView!
        
    
    var configuration: OrderCreatingOrderConfiguration?
    var order: Order?
    

    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
                
        configureTapRecognizer()

        configuration = OrderCreatingOrderConfiguration(maxCustomerCount: 5,
                                                        availableOptions: [OrderOption(id: 1, name: "У окна"),
                                                                           OrderOption(id: 2, name: "Мягкие сидения"),
                                                                           OrderOption(id: 3, name: "Близко к туалету")],
                                                        availableDates: [1583424000,
                                                                         1583427600])
        order = Order(customerCount: 1, optionIds: [], dateTime: nil)
    }
    
    
    //MARK: Configurations
    
    private func configureTapRecognizer() {
        let tapRecognizer = UITapGestureRecognizer(target: self,
                                                   action: #selector(viewTapped))
        view.addGestureRecognizer(tapRecognizer)
    }
    
    
    //MARK: Gesture Recognizer
    @objc private func viewTapped() {
        view.endEditing(true)
    }
    
    
    //MARK: IBActions
    @IBAction func butChooseDateTime(_ sender: Any) {
        
    }
    
    
}


//MARK: Extensions
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


extension OrderCreatingOrderVC :CreateOrderToolbarViewDelegate {
    
    func butCreateOrderTapped() {
        print("забронировано")
    }
    
}
