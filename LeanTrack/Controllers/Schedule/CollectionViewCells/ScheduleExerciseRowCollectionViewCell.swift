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
    
    let addSetButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add Set", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.setCustomFont(size: 12, fontType: CustomFonts.conduitBold)
        button.layer.cornerRadius = 3
        button.clipsToBounds = true
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1.0
        button.backgroundColor = .clear
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        [exerciseNameLabel,addSetButton].forEach {
            addSubview($0)
        }
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init (coder) has not been implemented")
    }
    
    func setupViews(){
        exerciseNameLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, traling: nil)
        addSetButton.anchor(top: nil, leading: nil, bottom: nil, traling: trailingAnchor, padding: .zero, size: .init(width: 60, height: 25))
        addSetButton.centerYAnchor.constraint(equalTo: exerciseNameLabel.centerYAnchor).isActive = true
    }
}
