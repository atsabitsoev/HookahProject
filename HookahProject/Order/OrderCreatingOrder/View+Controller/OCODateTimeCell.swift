//
//  OCODateTimeCell.swift
//  HookahProject
//
//  Created by Ацамаз Бицоев on 01.03.2020.
//  Copyright © 2020 Ацамаз Бицоев. All rights reserved.
//

import UIKit


class OCODateTimeCell: UITableViewCell {
    
    
    @IBOutlet weak var labDateTime: UILabel!
    
    
    func fill(dateTimeString: String?) {
        labDateTime.text = dateTimeString ?? "Выберите время бронирования"
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
