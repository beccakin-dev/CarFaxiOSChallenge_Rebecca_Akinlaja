//
//  DoubleExtension.swift
//  CarFaxHomeProject
//
//  Created by Becca Akinlaja on 9/16/19.
//  Copyright © 2019 Becca Akinlaja. All rights reserved.
//

import Foundation


extension Double {
    func truncate(places: Int) -> Double {
        return Double(floor(pow(10.0, Double(places)) * self)/pow(10.0, Double(places)))
    }
}
