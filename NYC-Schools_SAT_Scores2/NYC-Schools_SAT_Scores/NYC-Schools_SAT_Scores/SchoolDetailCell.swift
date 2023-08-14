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
    
//    public var schoolImage: UIImageView = {
//        let image = UIImageView()
//        image.image = UIImage(named: "School.png")
//        image.contentMode = .scaleAspectFill
//        image.clipsToBounds = true
//        return image
//    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
          contentView.backgroundColor = .white
          contentView.addSubview(schoolNameLabel)
//        contentView.addSubview(schoolImage)
        commonInit()
        }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        //fatalError("init(coder:) has not been implemented")
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

//    private func setupSchoolImageConstraint() {
//        addSubview(schoolImage)
//        schoolImage.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            schoolImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
//            schoolImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
//            schoolImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
//            schoolImage.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.20)
//        ])
//    }
}
