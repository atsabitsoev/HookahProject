//
//  OrderCreatingOrderTableview.swift
//  HookahProject
//
//  Created by Ацамаз Бицоев on 27.02.2020.
//  Copyright © 2020 Ацамаз Бицоев. All rights reserved.
//

import UIKit


extension OrderCreatingOrderVC: UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        
        return configuration?.availableOptions.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "OCOCustomerCountCell") as! OCOCustomerCountCell
            cell.delegate = self
            if let configuration = configuration {
                cell.stepperCustomersCount.maximumValue = Double(configuration.maxCustomerCount)
            }
            return cell
            
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "OCOOrderOptionCell") as! OCOOrderOptionCell
            cell.delegate = self
            guard let currentOrderOptioin = configuration?.availableOptions[indexPath.row] else { return UITableViewCell() }
            let isIncluded = order!.optionIds.contains(currentOrderOptioin.id)
            cell.fill(with: currentOrderOptioin, isIncluded: isIncluded)
            return cell
            
        }
        
    }
    
    
}


extension OrderCreatingOrderVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 145
        } else {
            return 44
        }
    }
    
}
