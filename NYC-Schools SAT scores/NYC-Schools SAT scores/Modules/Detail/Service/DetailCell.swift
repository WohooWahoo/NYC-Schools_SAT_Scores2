//
//  DetailCell.swift
//  NYC-Schools SAT scores
//
//  Created by randall_b on 8/8/23.
//  Copyright © 2023 randall_b. All rights reserved.
//

import UIKit

class DetailCell: UITableViewCell {
    
    //This is messy!!
    
    
    var cellTitle: String? {
        didSet {
            textLabel?.text = cellTitle
        }
    }
    
    var cellDetail: String? {
        didSet {
            detailTextLabel?.text = cellDetail
        }
    }
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        textLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        textLabel?.numberOfLines = 0
        detailTextLabel?.textColor = .black
        detailTextLabel?.font = UIFont.systemFont(ofSize: 20, weight: .light)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
}
