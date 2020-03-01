//
//  CreateOrderToolbarView.swift
//  HookahProject
//
//  Created by Ацамаз Бицоев on 01.03.2020.
//  Copyright © 2020 Ацамаз Бицоев. All rights reserved.
//

import UIKit


protocol CreateOrderToolbarViewDelegate {
    
    func butCreateOrderTapped()
    
}


class CreateOrderToolbarView: UIView {

    
    @IBOutlet weak var butCreateOrder: UIButton!
    
    
    var delegate: CreateOrderToolbarViewDelegate?
    
    
    func setDateString(_ dateString: String) {
        let titleForButton = "Забронировать на \(dateString)"
        butCreateOrder.setTitle(titleForButton,
                                for: .normal)
        if !butCreateOrder.isEnabled {
            butCreateOrder.isEnabled = true
            butCreateOrder.alpha = 1
        }
    }
    
    
    
    @IBAction func butCreateOrderTapped(_ sender: Any) {
        
        delegate?.butCreateOrderTapped()
    }
    
}
