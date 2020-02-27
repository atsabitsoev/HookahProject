//
//  OCOOrderOptionCell.swift
//  HookahProject
//
//  Created by Ацамаз Бицоев on 27.02.2020.
//  Copyright © 2020 Ацамаз Бицоев. All rights reserved.
//

import UIKit


protocol OCOOrderOptionCellDelegate {
    func addOption(id: Int)
    func deleteOption(id: Int)
}


class OCOOrderOptionCell: UITableViewCell {
    
    
    @IBOutlet weak var labTItle: UILabel!
    @IBOutlet weak var switchInclude: UISwitch!
    
    
    var delegate: OCOOrderOptionCellDelegate?
    
    
    var optionId: Int!
    
    
    func fill(with option: OrderOption, isIncluded: Bool) {
        self.optionId = option.id
        labTItle.text = option.name
        switchInclude.setOn(isIncluded, animated: false)
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
        
    @IBAction func switchIncludeChanged(_ sender: UISwitch) {
        sender.isOn ? delegate?.addOption(id: optionId) : delegate?.deleteOption(id: optionId)
    }
    

}
