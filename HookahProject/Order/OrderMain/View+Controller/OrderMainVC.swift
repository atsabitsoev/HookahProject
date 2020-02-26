//
//  OrderMainVC.swift
//  HookahProject
//
//  Created by Ацамаз Бицоев on 26.02.2020.
//  Copyright © 2020 Ацамаз Бицоев. All rights reserved.
//

import UIKit

class OrderMainVC: UIViewController {
    
    
    @IBOutlet weak var imageRestaurant: UIImageView!
    @IBOutlet weak var butCreateOrder: UIButton!
    
    
    var firstViewWillLayoutSubviews = true
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        if firstViewWillLayoutSubviews {
            roundImageRestaurant()
            roundButCreateOrder()
            firstViewWillLayoutSubviews = false
        }
    }
    
    
    private func roundImageRestaurant() {
        imageRestaurant.layer.cornerRadius = imageRestaurant.bounds.width / 2
    }
    
    private func roundButCreateOrder() {
        butCreateOrder.layer.cornerRadius = 8
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
