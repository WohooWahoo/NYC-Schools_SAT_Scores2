//
//  SchoolService.swift
//  NYC-Schools SAT scores
//
//  Created by randall_b on 8/8/23.
//  Copyright © 2023 randall_b. All rights reserved.
//

import Foundation

class SchoolService: NSObject {
    static let sharedInstance = SchoolService()
    
    func fetchSchools(completion: @escaping ([School]?, Error?) -> ()) {
        let urlString = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err {
                completion(nil, err)
                print("Failed to fetch courses:", err)
                return
            }
            
            // check response
            
            guard let data = data else { return }
            do {
                let schools = try JSONDecoder().decode([School].self, from: data)
                DispatchQueue.main.async {
                    completion(schools, nil)
                }
            } catch let jsonErr {
                print("Failed to decode:", jsonErr)
            }
            }.resume()
    }
}
