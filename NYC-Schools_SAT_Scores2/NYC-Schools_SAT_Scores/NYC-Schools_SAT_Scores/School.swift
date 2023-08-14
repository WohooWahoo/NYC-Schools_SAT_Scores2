//
//  School.swift
//  NYC-Schools_SAT_Scores
//
//  Created by Randall_B on 8/12/23.
//

import Foundation

struct School: Decodable {
    
    let dbn: String
    let schoolName: String
    let buildingCode: String?
    let neighborhood: String
    let phoneNumber: String
    let primaryAddressLine1: String
    let city: String
    
    private enum CodingKeys: String, CodingKey {
        case dbn
        case schoolName = "school_name"
        case buildingCode = "building_code"
        case neighborhood
        case phoneNumber = "phone_number"
        case primaryAddressLine1 = "primary_address_line_1"
        case city
    }
}

