//
//  OrderMainVC.swift
//  HookahProject
//
//  Created by Ацамаз Бицоев on 26.02.2020.
//  Copyright © 2020 Ацамаз Бицоев. All rights reserved.
//

import UIKit

class OrderMainVC: UIViewController {
    

    @IBOutlet weak var butCreateOrder: UIButton!
    @IBOutlet weak var viewRestaurantInfo: UIView!
    @IBOutlet weak var viewOrderStatus: ViewOrderStatus!
    @IBOutlet weak var viewPlaceholder: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    var viewOrderStatusConfiguration: ViewOrderStatusConfiguration?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setShadowToViewRestaurantInfo(color: UIColor.systemBlue)
        setShadowToViewOrderStatus(color: UIColor.black)
        setViewOrderStatusConfiguration()
    }
    
    
    private func setShadowToViewRestaurantInfo(color: UIColor) {
        viewRestaurantInfo.layer.shadowColor = color.cgColor
        viewRestaurantInfo.layer.shadowOpacity = 0.5
        viewRestaurantInfo.layer.shadowRadius = 5
        viewRestaurantInfo.layer.shadowOffset = CGSize(width: 0, height: 2)
        viewRestaurantInfo.layer.cornerRadius = 16
    }
    
    private func setShadowToViewOrderStatus(color: UIColor) {
        viewOrderStatus.layer.shadowColor = color.cgColor
        viewOrderStatus.layer.shadowOpacity = 0.1
        viewOrderStatus.layer.shadowRadius = 5
        viewOrderStatus.layer.shadowOffset = CGSize(width: 0, height: 2)
        viewOrderStatus.layer.cornerRadius = 16
    }
    
    
    private func setViewOrderStatusConfiguration() {
        
        setButCreateOrder()
        
        guard let viewOrderStatusConfiguration = viewOrderStatusConfiguration else {
            viewOrderStatus.isHidden = true
            viewPlaceholder.isHidden = false
            setShadowToViewRestaurantInfo(color: .systemBlue)
            return
        }
        viewOrderStatus.isHidden = false
        viewPlaceholder.isHidden = true
        setShadowToViewRestaurantInfo(color: UIColor.black.withAlphaComponent(0.2))
        viewOrderStatus.configure(viewOrderStatusConfiguration)
    }
    
    
    private func setButCreateOrder() {
        
        if let viewOrderStatusConfiguration = viewOrderStatusConfiguration {
            if viewOrderStatusConfiguration.orderStatus == .denied {
                butCreateOrder.setTitle("Ок", for: .normal)
                butCreateOrder.backgroundColor = .systemBlue
            } else {
                butCreateOrder.setTitle("Отменить бронь", for: .normal)
                butCreateOrder.backgroundColor = .systemRed
            }
        } else {
            butCreateOrder.setTitle("Забронировать столик", for: .normal)
            butCreateOrder.backgroundColor = .systemBlue
        }
    }
    
    
    private func showOrderCreatingOrderVC() {
        let storyboard = UIStoryboard(name: "OrderCreatingOrder", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "OrderCreatingOrderVC")
        self.navigationController?.show(vc, sender: nil)
    }
    
    
    @IBAction func butCreateOrderTapped(_ sender: Any) {
        showOrderCreatingOrderVC()
    }
    
}
