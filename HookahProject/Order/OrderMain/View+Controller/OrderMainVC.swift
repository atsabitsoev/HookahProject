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
    
    
    
    var firstViewWillLayoutSubviews = true
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setShadowToViewRestaurantInfo(color: UIColor.systemBlue)
    }
    
    
    private func setShadowToViewRestaurantInfo(color: UIColor) {
        viewRestaurantInfo.layer.shadowColor = color.cgColor
        viewRestaurantInfo.layer.shadowOpacity = 0.5
        viewRestaurantInfo.layer.shadowRadius = 3
        viewRestaurantInfo.layer.shadowOffset = CGSize(width: 0, height: 2)
        viewRestaurantInfo.layer.cornerRadius = 16
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
