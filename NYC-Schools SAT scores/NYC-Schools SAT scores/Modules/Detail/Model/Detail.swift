//
//  Detail.swift
//  NYC-Schools SAT scores
//
//  Created by randall_b on 8/8/23.
//  Copyright © 2023 randall_b. All rights reserved.
//

import Foundation

struct Detail: Decodable {
    
    var sat_critical_reading_avg_score: String
    var sat_math_avg_score: String
    var sat_writing_avg_score: String
    var num_of_sat_test_takers: String
    var dbn: String
    
}
