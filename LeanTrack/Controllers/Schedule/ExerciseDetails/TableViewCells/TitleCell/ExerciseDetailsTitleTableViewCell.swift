//
//  ExerciseDetailsTitleTableViewCell.swift
//  LeanTrack
//
//  Created by KUTAN ÇINGISIZ on 27.03.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

class ExerciseDetailsTitleTableViewCell: UITableViewCell {
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.setCustomFont(size: 16, fontType: CustomFonts.conduitLight)
        return label
    }()
    
    let subTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.brownGrey
        label.setCustomFont(size: 12, fontType: CustomFonts.conduitLight)
        return label
    }()
    
    var titleBottomConstraint: NSLayoutConstraint!
    var titleTrailingConstraint: NSLayoutConstraint!
    
    var subTitleBottomConstraint: NSLayoutConstraint!
    var subTitleTrailingConstraint: NSLayoutConstraint!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        [titleLabel,subTitleLabel].forEach {
            addSubview($0)
        }
        
        titleLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, traling: nil)
        titleBottomConstraint = titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        titleBottomConstraint.isActive = true
        titleTrailingConstraint = titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        titleTrailingConstraint.isActive = true
        
        subTitleLabel.anchor(top: titleLabel.bottomAnchor, leading: titleLabel.leadingAnchor, bottom: nil, traling: nil)
        subTitleBottomConstraint = subTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        subTitleBottomConstraint.isActive = false
        subTitleTrailingConstraint = subTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        subTitleTrailingConstraint.isActive = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
