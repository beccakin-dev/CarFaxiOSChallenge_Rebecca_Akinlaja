//
//  Vehicle.swift
//  CarFaxHomeProject
//
//  Created by Becca Akinlaja on 9/12/19.
//  Copyright © 2019 Becca Akinlaja. All rights reserved.
//

import Foundation

class Vehicle {
   // MARK: - Variables
            var  vehicleYear: Int!
            var  vehicleMake: String!
            var  vehicleModel: String!
            var  vehicleImage: String!
            var  vehicleListPrice: Int!
            var  vehicleMileage: Int!
            var  vehicleCity: String!
            var  vehicleState: String!
            var  vehicleTrim: String!
            var  dealerPhoneNumber: String!
    
    // MARK: - init
    init(vehiclesDict: Dictionary<String, AnyObject>) {
        self.vehicleYear = vehiclesDict["year"] as? Int ?? 0
        self.vehicleMake = (vehiclesDict["make"] as? String) ?? ""
        self.vehicleModel = vehiclesDict["model"] as? String ?? ""
        self.vehicleListPrice = vehiclesDict["listPrice"] as? Int ?? 0
        self.vehicleMileage = vehiclesDict["mileage"] as? Int ?? 0
        self.vehicleCity = vehiclesDict["dealer"]?["city"] as? String ?? ""
        self.vehicleState = vehiclesDict["dealer"]?["state"] as? String ?? ""
        self.vehicleTrim = vehiclesDict["trim"] as? String ?? ""
        self.dealerPhoneNumber = vehiclesDict["dealer"]?["phone"] as? String ?? ""
       self.vehicleImage = vehiclesDict["images"]?["baseUrl"] as? String ?? ""

        }
       
    
    
    
   
    
}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    





