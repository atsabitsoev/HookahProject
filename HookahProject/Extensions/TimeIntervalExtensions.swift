//
//  TimeIntervalExtensions.swift
//  HookahProject
//
//  Created by Ацамаз Бицоев on 01.03.2020.
//  Copyright © 2020 Ацамаз Бицоев. All rights reserved.
//

import Foundation


extension TimeInterval {
    
    func getDateTimeString(format: String) -> String {
        let date = Date(timeIntervalSince1970: self)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
    
}
