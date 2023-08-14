//
//  SchoolService.swift
//  NYC-Schools_SAT_Scores
//
//  Created by Randall_B on 8/12/23.
//

import Foundation

class SchoolService: NSObject {
    
    // Fetch Schools JSON from REST API
    func fetchSchools(URL url: String, completion: @escaping ([School]) -> Void) {
        let url = URL(string: url)
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!) { data, response, error in
            if data != nil && error == nil {
                do {
                    let parsingData = try JSONDecoder().decode([School].self, from: data!)
                    completion(parsingData)
                } catch {
                    print("Parsing error \(error)")
                }
            }
        }
        dataTask.resume()
    }
    
    
    // Fetch SAT Score JSON from REST API
    func fetchScores(URL url: String, completion: @escaping ([Score]) -> Void) {
        let url = URL(string: url)
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!) { data, response, error in
            if data != nil && error == nil {
                do {
                    let parsingData = try JSONDecoder().decode([Score].self, from: data!)
                    completion(parsingData)
                } catch {
                    print("Parsing error \(error)")
                }
            }
        }
        dataTask.resume()
    }
}
