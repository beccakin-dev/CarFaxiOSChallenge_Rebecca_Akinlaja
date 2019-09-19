//
//  ValidatePhoneNumber.swift
//  CarFaxHomeProject
//
//  Created by Becca Akinlaja on 9/16/19.
//  Copyright © 2019 Becca Akinlaja. All rights reserved.
//

import Foundation

func ValidatePhoneNumber(phoneNumber stringPhoneNumber: String) -> String? {
    // Remove any invalid character
    let numVal = stringPhoneNumber.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
    let length = numVal.count
    let withLeadingOne = numVal.hasPrefix("1")
    
    // Check for valid phone number length
    guard length == 7 || length == 10 || (length == 11 && withLeadingOne) else {
        return nil
    }
    
    let withAreaCode = (length >= 10)
    var stringIndex = 0
    
    // Leading 1
    var leadingOne = ""
    if withLeadingOne {
        leadingOne = "1 "
        stringIndex += 1
    }
    
    // Area code
    var areaCode = ""
    if withAreaCode {
        let areaCodeLength = 3
        guard let areaCodeSubstring = numVal.substring(start: stringIndex, offsetBy: areaCodeLength) else {
            return nil
        }
        areaCode = String(format: "(%@) ", areaCodeSubstring)
        stringIndex += areaCodeLength
    }
    
    // Prefix
    let prefixLength = 3
    guard let prefix = numVal.substring(start: stringIndex, offsetBy: prefixLength) else {
        return nil
    }
    stringIndex += prefixLength
    
    // Suffix
    let suffixLength = 4
    guard let suffix = numVal.substring(start: stringIndex, offsetBy: suffixLength) else {
        return nil
    }
    let validPhoneNumber = leadingOne + areaCode + prefix + "-" + suffix
    
    return validPhoneNumber
}
