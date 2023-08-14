//
//  SchoolCell.swift
//  NYC-Schools_SAT_Scores
//
//  Created by Randall_B on 8/12/23.
//

import UIKit

class SchoolDetailCell: UITableViewCell {
    
    static let identifier = "schoolCell"
    
    public var schoolNameLabel: UILabel = {
        let SchNameLbl = UILabel()
        SchNameLbl.textColor = .black
        SchNameLbl.font = .systemFont(ofSize: 15, weight: .bold)
        SchNameLbl.numberOfLines = 2
        return SchNameLbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
          contentView.backgroundColor = .white
          contentView.addSubview(schoolNameLabel)
        commonInit()
        }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        setupSchoolNameLabelConstraint()
        //setupSchoolImageConstraint()
    }
    
    private func setupSchoolNameLabelConstraint() {
        addSubview(schoolNameLabel)
        schoolNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            schoolNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            schoolNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            schoolNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            schoolNameLabel.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.9)
        ])
    }

}
