//
//  AddSuffix.swift
//  CarFaxHomeProject
//
//  Created by Becca Akinlaja on 9/15/19.
//  Copyright © 2019 Becca Akinlaja. All rights reserved.
//

import Foundation


func formatNumber(_ num: Int) -> String {
    
    let doubleNum = abs(Double(num))
    let sym = (num < 0) ? "-" : ""
    
    switch doubleNum {
        
    case 1_000_000_000...:
        var formattedNum = doubleNum / 1_000_000_000
        formattedNum = formattedNum.truncate(places: 1)
        return "\(sym)\(formattedNum)b"
        
    case 1_000_000...:
        var formattedNum = doubleNum / 1_000_000
        formattedNum = formattedNum.truncate(places: 1)
        return "\(sym)\(formattedNum)m"
        
    case 1_000...:
        var formattedNum = doubleNum / 1_000
        formattedNum = formattedNum.truncate(places: 1)
        return "\(sym)\(formattedNum)k"
        
    case 0...:
        return "\(num)"
        
    default:
        return "\(sym)\(num)"
        
    }
    
}
