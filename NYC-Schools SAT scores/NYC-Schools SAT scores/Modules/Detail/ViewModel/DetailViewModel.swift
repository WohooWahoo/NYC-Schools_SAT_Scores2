//
//  DetailViewModel.swift
//  NYC-Schools SAT scores
//
//  Created by randall_b on 8/8/23.
//  Copyright © 2023 randall_b. All rights reserved.
//

import Foundation

struct DetailViewModel {
    
    let math: String
    let reading: String
    let writing: String
    let testTaken: String
    
    init(detail: Detail) {
        self.math = detail.sat_math_avg_score
        self.reading = detail.sat_critical_reading_avg_score
        self.writing = detail.sat_writing_avg_score
        self.testTaken = detail.num_of_sat_test_takers
    }
    
    var detailDict: [String:String] {
        //If had more time I would not hard code these string values
        return["math":math, "reading":reading, "writing":writing]
        
    }
    
}

