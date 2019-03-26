//
//  ScheduleDayCollectionViewCell.swift
//  LeanTrack
//
//  Created by KUTAN ÇINGISIZ on 26.03.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

class ScheduleDayCollectionViewCell: UICollectionViewCell {
    let dayLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.setCustomFont(size: 18, fontType: CustomFonts.conduitLight)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(dayLabel)
        dayLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, traling: trailingAnchor)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init (coder) has not been implemented")
    }
}


