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
    @IBOutlet weak var viewCard: UIView!
    
    
    var firstViewWillLayoutSubviews = true
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        if firstViewWillLayoutSubviews {
            roundButCreateOrder()
            setShadowToViewCard()
            firstViewWillLayoutSubviews = false
        }
    }
    
    
    private func roundButCreateOrder() {
        butCreateOrder.layer.cornerRadius = 8
    }
    
    private func setShadowToViewCard() {
        viewCard.layer.shadowColor = UIColor.black.cgColor
        viewCard.layer.shadowOpacity = 0.1
        viewCard.layer.shadowOffset = CGSize(width: 0, height: 2)
        viewCard.layer.shadowRadius = 10
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
