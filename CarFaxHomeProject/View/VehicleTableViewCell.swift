//
//  VehicleTableViewCell.swift
//  CarFaxHomeProject
//
//  Created by Becca Akinlaja on 9/13/19.
//  Copyright © 2019 Becca Akinlaja. All rights reserved.
//

import UIKit

class VehicleTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var vehiclePhoto: UIImageView!
    @IBOutlet weak var vehicle_year_make_model_trim: UILabel!
    @IBOutlet weak var vehicle_price_mileage_location: UILabel!
    @IBOutlet weak var dealerPhoneNumber: UIButton!
    
    // MARK: - Action
    @IBAction func callDealer(_ sender: Any) {
        let dealerNumberString = dealerPhoneNumber.titleLabel?.text
        let dealerPhoneNum = dealerNumberString?.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        guard let validNumber = URL(string: "tel://\(dealerPhoneNum!)") else { return }
        UIApplication.shared.open(validNumber)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
   
    //configuring cell
    func configureCell(vehicleInfo: Vehicle) {
        
        var trim = " "
        if vehicleInfo.vehicleTrim.lowercased() != "unspecified" {
            trim = "\(vehicleInfo.vehicleTrim!)"
        }
        
        
        self.vehicle_year_make_model_trim.text  = "\(vehicleInfo.vehicleYear!) \(vehicleInfo.vehicleMake!) \(vehicleInfo.vehicleModel!) \(trim)"
        self.vehicle_year_make_model_trim.font = UIFont.boldSystemFont(ofSize: 17)
        
        
        
        do {
            let url = URL(string: "\(String(vehicleInfo.vehicleImage))1/640x480")
            let data = try Data(contentsOf: (url)!)
            self.vehiclePhoto.image = UIImage(data: data)
        } catch {
            print(error)
        }
       
        let boldPriceText  = "$\(PriceValidator(vehiclePrice: vehicleInfo.vehicleListPrice))"
        let attr = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 17)]
        let attributedString = NSMutableAttributedString(string:boldPriceText, attributes:attr)
        
        let mileage_state_city = " | \(formatNumber(vehicleInfo.vehicleMileage)) Mi | \(vehicleInfo.vehicleCity!), \(vehicleInfo.vehicleState!)"
        let mileage_state_city_string = NSMutableAttributedString(string:mileage_state_city)
        
        attributedString.append(mileage_state_city_string)
        self.vehicle_price_mileage_location.attributedText = attributedString
        
        
        let dealerPhoneNo = ValidatePhoneNumber(phoneNumber: "\(String(describing: vehicleInfo.dealerPhoneNumber))")
        self.dealerPhoneNumber.setTitle("\(dealerPhoneNo!)", for: .normal)
        
        
    }

}
