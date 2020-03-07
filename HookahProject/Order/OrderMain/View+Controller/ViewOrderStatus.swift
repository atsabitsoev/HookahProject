//
//  ViewOrderStatusView.swift
//  HookahProject
//
//  Created by Ацамаз Бицоев on 07.03.2020.
//  Copyright © 2020 Ацамаз Бицоев. All rights reserved.
//

import Foundation
import UIKit


struct ViewOrderStatusConfiguration {
    
    
    var orderNumber: String
    var personCount: Int
    var dateTimeString: String
    var options: [String] = []
    var orderStatus: OrderStatus
    
}


class ViewOrderStatus: UIView {
    
    @IBOutlet weak var labOrderNumber: UILabel!
    @IBOutlet weak var labPersonCount: UILabel!
    @IBOutlet weak var labDateTime: UILabel!
    @IBOutlet weak var stackOptions: UIStackView!
    @IBOutlet weak var viewStatusBackground: UIView!
    @IBOutlet weak var labStatus: UILabel!
    @IBOutlet weak var imStatus: UIImageView!
    
    
    func configure(_ configuration: ViewOrderStatusConfiguration) {
        
        labOrderNumber.text = "Бронь №\(configuration.orderNumber)"
        labPersonCount.text = getPersonCountString(count: configuration.personCount)
        labDateTime.text = configuration.dateTimeString
        setStackOptions(configuration.options)
        setOrderStatus(configuration.orderStatus)
        layoutIfNeeded()
    }
    
    
    private func getPersonCountString(count: Int) -> String {
        
        var personCountAddingString = ""
        if count >= 11 && count <= 14 {
            personCountAddingString = "персон"
        } else {
            switch "\(count)".last {
            case "1":
                personCountAddingString = "персона"
            case "2", "3", "4":
                personCountAddingString = "персоны"
            default:
                personCountAddingString = "персон"
            }
        }
        return "\(count) \(personCountAddingString)"
    }
    
    private func setStackOptions(_ options: [String]) {
        
        let labels = options.map { (option) -> UILabel in
            let label = UILabel()
            label.text = "– " + option
            return label
        }
        stackOptions.arrangedSubviews.forEach { (view) in
            stackOptions.removeArrangedSubview(view)
            view.removeFromSuperview()
        }
        labels.forEach { (label) in
            self.stackOptions.addArrangedSubview(label)
        }
    }
    
    private func setOrderStatus(_ status: OrderStatus) {
        
        var statusImageName: String!
        var statusColor: UIColor!
        var statusText: String!
        
        switch status {
        case .waiting:
            statusImageName = "hourglass"
            statusColor = .systemYellow
            statusText = "Ожидает подтверждения..."
        case .approved:
            statusImageName = "correct"
            statusColor = .systemGreen
            statusText = "Бронь подтверждена!"
        case .denied:
            statusImageName = "forbidden"
            statusColor = .systemRed
            statusText = "Бронь отклонена менеджером"
        }
        
        imStatus.image = UIImage(named: statusImageName)
        labStatus.text = statusText
        viewStatusBackground.backgroundColor = statusColor
    }
    
}
