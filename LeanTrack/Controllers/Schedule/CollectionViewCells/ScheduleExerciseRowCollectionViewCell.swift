//
//  ScheduleExerciseRowCollectionViewCell.swift
//  LeanTrack
//
//  Created by KUTAN ÇINGISIZ on 26.03.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

class ScheduleExerciseRowCollectionViewCell: UICollectionViewCell {
    let exerciseNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.setCustomFont(size: 18, fontType: CustomFonts.conduitBold)
        label.textAlignment = .left
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        [exerciseNameLabel].forEach {
            addSubview($0)
        }
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init (coder) has not been implemented")
    }
    
    func setupViews(){
        exerciseNameLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, traling: nil)
    }
}
