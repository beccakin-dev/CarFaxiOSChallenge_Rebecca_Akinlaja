//
//  PriceValidator.swift
//  CarFaxHomeProject
//
//  Created by Becca Akinlaja on 9/15/19.
//  Copyright © 2019 Becca Akinlaja. All rights reserved.
//

import Foundation

func PriceValidator(vehiclePrice: Int) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = NumberFormatter.Style.decimal
    
    let amount = vehiclePrice
    let formattedString = formatter.string(for: amount)
    return formattedString ?? String(vehiclePrice)
}
