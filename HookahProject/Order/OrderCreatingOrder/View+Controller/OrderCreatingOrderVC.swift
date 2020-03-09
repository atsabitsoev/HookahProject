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
    @IBOutlet var viewSelectDateTime: UIView!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var labTitleSelectDateTime: UILabel!
    @IBOutlet weak var labSelectedDay: UILabel!
    @IBOutlet weak var butConfirmDateTime: UIButton!
    
    var tapRecognizer: UITapGestureRecognizer!
            
    
    var configuration: OrderCreatingOrderConfiguration?
    var order: Order?
    
    
    var availableFullDates: [Int] = []
    var shouldShowTimes: Bool {
        get {
            return !availableFullDates.isEmpty
        }
    }
    

    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
                
        setDelegates()
        configureTapRecognizer()
        configureViewSelectDateTime()

        configuration = OrderCreatingOrderConfiguration(maxCustomerCount: 5,
                                                        availableOptions: [OrderOption(id: 1, name: "У окна"),
                                                                           OrderOption(id: 2, name: "Мягкие сидения"),
                                                                           OrderOption(id: 3, name: "Близко к туалету")],
                                                        availableDays: [1583452800,
                                                                        1583539200,
                                                                        1583798400])
        order = Order(customerCount: 1, options: [], dateTime: nil)
    }
    
    
    //MARK: Set Delegates
    private func setDelegates() {
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    
    //MARK: Configurations
    private func configureTapRecognizer() {
        tapRecognizer = UITapGestureRecognizer(target: self,
                                               action: #selector(viewTapped))
        tapRecognizer.isEnabled = false
        tabBarController?.view.addGestureRecognizer(tapRecognizer)
    }
    
    private func configureViewSelectDateTime() {
        tabBarController?.view.addSubview(viewSelectDateTime)
        viewSelectDateTime.frame = CGRect(x: 0,
                                          y: UIScreen.main.bounds.maxY,
                                          width: UIScreen.main.bounds.width,
                                          height: 352)
        viewSelectDateTime.layer.cornerRadius = 16
        viewSelectDateTime.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
    
    
    //MARK: Gesture Recognizer
    @objc private func viewTapped() {
        hideViewSelectDateTime()
        availableFullDates = []
    }
    
    
    //MARK: View Select Date Time
    private func showViewSelectDateTime() {
        
        reloadViewSelectDateTime()
        navigationController?.view.isUserInteractionEnabled = false
        
        tapRecognizer.isEnabled = true
        UIView.animate(withDuration: 0.3) {
            self.navigationController?.view.alpha = 0.5
            self.viewSelectDateTime.frame = CGRect(x: 0,
                                                   y: self.viewSelectDateTime.frame.minY - self.viewSelectDateTime.bounds.height,
                                                   width: self.viewSelectDateTime.bounds.width,
                                                   height: self.viewSelectDateTime.bounds.height)
        }
    }
    
    private func hideViewSelectDateTime() {

        navigationController?.view.isUserInteractionEnabled = true
        
        tapRecognizer.isEnabled = false
        UIView.animate(withDuration: 0.3) {
            self.navigationController?.view.alpha = 1
            self.viewSelectDateTime.frame = CGRect(x: 0,
                                                   y: self.viewSelectDateTime.frame.minY + self.viewSelectDateTime.bounds.height,
                                                   width: self.viewSelectDateTime.bounds.width,
                                                   height: self.viewSelectDateTime.bounds.height)
        }
        
    }
    
    private func hideAndShowViewSelectDateTime() {
        UIView.animate(withDuration: 0.15,
                       animations: {
                        self.viewSelectDateTime.frame = CGRect(x: 0,
                                                               y: self.viewSelectDateTime.frame.minY + self.viewSelectDateTime.bounds.height,
                                                               width: self.viewSelectDateTime.bounds.width,
                                                               height: self.viewSelectDateTime.bounds.height)
        }) { (_) in
            self.reloadViewSelectDateTime()
            UIView.animate(withDuration: 0.15) {
                self.viewSelectDateTime.frame = CGRect(x: 0,
                                                       y: self.viewSelectDateTime.frame.minY - self.viewSelectDateTime.bounds.height,
                                                       width: self.viewSelectDateTime.bounds.width,
                                                       height: self.viewSelectDateTime.bounds.height)
            }
        }
    }
    
    
    private func reloadViewSelectDateTime() {
        pickerView.reloadAllComponents()
        labTitleSelectDateTime.text = shouldShowTimes ? "Выбрать время" : "Выбрать день"
        labSelectedDay.text = shouldShowTimes ? configuration?.availableDays[pickerView.selectedRow(inComponent: 0)].getDateStringFromSeconds(dateFormat: "dd/MM/yyyy") : ""
        let butTitle = shouldShowTimes ? "Забронировать" : "Подтвердить"
        let butColor = shouldShowTimes ? UIColor.systemGreen : UIColor.systemBlue
        butConfirmDateTime.setTitle(butTitle, for: .normal)
        butConfirmDateTime.backgroundColor = butColor
    }
    
    
    //MARK: API Work
    private func getAvailableFullDates() {
        availableFullDates = [1583589600, 1583591400, 1583600400, 1583609400]
        hideAndShowViewSelectDateTime()
    }
    
    
    private func createOrder() {
        hideViewSelectDateTime()
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
    //MARK: IBActions
    @IBAction func butChooseDateTime(_ sender: Any) {
        showViewSelectDateTime()
    }
    
    
    @IBAction func butConfirmDateTimeTapped(_ sender: Any) {
        if shouldShowTimes {
            createOrder()
        } else {
            getAvailableFullDates()
        }
    }
    
    
}


//MARK: Extensions



//MARK: Customer Count Cell
extension OrderCreatingOrderVC: OCOCustomerCountCellDelegate {
    
    func customerCountChanged(to count: Int) {
        order?.customerCount = count
    }
    
}


//MARK: Option Cell
extension OrderCreatingOrderVC: OCOOrderOptionCellDelegate {
    
    func addOption(option: OrderOption) {
        order?.options.append(option)
        print(order!.options)
    }
    
    func deleteOption(option: OrderOption) {
        guard let indexOfOption = order?.options.firstIndex(of: option) else { return }
        order?.options.remove(at: indexOfOption)
        print(order!.options)
    }
    
}


//MARK: Picker View
extension OrderCreatingOrderVC: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if shouldShowTimes {
            return availableFullDates.count
        } else {
            return configuration?.availableDays.count ?? 0
        }
    }
    
}

extension OrderCreatingOrderVC: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if shouldShowTimes {
            return availableFullDates[row].getDateStringFromSeconds(dateFormat: "HH:mm")
        } else {
            return configuration?.availableDays[row].getDateStringFromSeconds(dateFormat: "d MMMM")
        }
    }
    
}
