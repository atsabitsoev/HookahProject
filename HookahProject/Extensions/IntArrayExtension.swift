//
//  IntArrayExtension.swift
//  HookahProject
//
//  Created by Ацамаз Бицоев on 04.03.2020.
//  Copyright © 2020 Ацамаз Бицоев. All rights reserved.
//

import Foundation


extension Array where Element == Int {
    
    func dateStrings(dateFormat: String) -> [String] {
        return self.map { (seconds) -> String in
            return seconds.getDateStringFromSeconds(dateFormat: dateFormat)
        }
    }
    
}
