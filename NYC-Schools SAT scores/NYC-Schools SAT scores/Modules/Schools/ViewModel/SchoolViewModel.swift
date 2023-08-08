//
//  SchoolViewModel.swift
//  NYC-Schools SAT scores
//
//  Created by randall_b on 8/8/23.
//  Copyright © 2023 randall_b. All rights reserved.
//

import Foundation

struct SchoolViewModel {
    
    let name: String
    let city: String
    let dbn: String
    
    init(school: School) {
        self.name = school.school_name
        self.city = school.city
        self.dbn = school.dbn
    }
    
}
