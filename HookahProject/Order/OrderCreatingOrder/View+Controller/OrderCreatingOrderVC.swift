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
    
    var tfDatePicker: UITextField!
    var datePicker: UIDatePicker!
    var toolbarDate: CreateOrderToolbarView?
    
    
    var configuration: OrderCreatingOrderConfiguration?
    var order: Order?
    

    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureDatePicker()
        configureToolbarDate()
        configureTapRecognizer()

        configuration = OrderCreatingOrderConfiguration(maxCustomerCount: 5,
                                                        availableOptions: [OrderOption(id: 1, name: "У окна"),
                                                                           OrderOption(id: 2, name: "Мягкие сидения"),
                                                                           OrderOption(id: 3, name: "Близко к туалету")],
                                                        availableDates: [],
                                                        availableTimes: [])
        order = Order(customerCount: 1, optionIds: [], dateTime: nil)
    }
    
    
    //MARK: Configurations
    private func configureDatePicker() {
        
        tfDatePicker = UITextField()
        view.addSubview(tfDatePicker)

        datePicker = UIDatePicker()
        datePicker.date = Date()
        datePicker.datePickerMode = .dateAndTime
        datePicker.locale = Locale(identifier: "RU")
        datePicker.addTarget(self,
                             action: #selector(dateTimePickerChanged(_:)),
                             for: .valueChanged)
        datePicker.minuteInterval = 30
        
        tfDatePicker.inputView = datePicker
    }
    
    private func configureToolbarDate() {
        
        toolbarDate = Bundle.main.loadNibNamed("CreateOrderToolbar",
                                               owner: self,
                                               options: nil)?.last as? CreateOrderToolbarView
        toolbarDate?.delegate = self
        tfDatePicker.inputAccessoryView = toolbarDate
    }
    
    private func configureTapRecognizer() {
        let tapRecognizer = UITapGestureRecognizer(target: self,
                                                   action: #selector(viewTapped))
        view.addGestureRecognizer(tapRecognizer)
    }
    
    
    //MARK: DatePicker
    @objc private func datePickerDone() {
        self.view.endEditing(true)
    }
    
    @objc private func dateTimePickerChanged(_ sender: UIDatePicker) {
        
        let datePicked = sender.date
        let timeInterval1970 = datePicked.timeIntervalSince(Date(timeIntervalSince1970: 0))
        order?.dateTime = timeInterval1970
        toolbarDate?.setDateString(timeInterval1970.getDateTimeString(format: "dd.MM.yyyy HH:mm"))
    }
    
    func showDateTimePicker() {
        tfDatePicker.becomeFirstResponder()
        let dateCurrent = Date()
        let dateCurrent1970 = dateCurrent.timeIntervalSince(Date(timeIntervalSince1970: 0))
        let minimumDate1970 = dateCurrent1970 - dateCurrent1970.truncatingRemainder(dividingBy: 30 * 60) + 30 * 60
        let minimumDate = Date(timeIntervalSince1970: minimumDate1970)
        datePicker.minimumDate = minimumDate
    }
    
    
    //MARK: Gesture Recognizer
    @objc private func viewTapped() {
        view.endEditing(true)
    }
    
    
    //MARK: IBActions
    @IBAction func butChooseDateTime(_ sender: Any) {
        showDateTimePicker()
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
