//
//  DetailService.swift
//  NYC-Schools SAT scores
//
//  Created by randall_b on 8/8/23.
//  Copyright © 2023 randall_b. All rights reserved.
//

import Foundation

class DetailService: NSObject {
    static let sharedInstance = DetailService()
    
    func fetchDetails(dbn: String, completion: @escaping (Detail?, Error?) -> ()) {
        let urlString = "https://data.cityofnewyork.us/resource/f9bf-2cp4.json"
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
                let details = try JSONDecoder().decode([Detail].self, from: data)
                DispatchQueue.main.async {
                    if let detail = details.filter({$0.dbn == dbn}).first { //This filter is very expensive especially with a large dataset
                        completion(detail, nil)
                    }
                    
                }
            } catch let jsonErr {
                print("Failed to decode:", jsonErr)
            }
            }.resume()
    }
    
}

