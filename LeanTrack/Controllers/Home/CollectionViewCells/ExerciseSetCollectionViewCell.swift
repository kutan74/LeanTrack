//
//  ExerciseSetCollectionViewCell.swift
//  LeanTrack
//
//  Created by KUTAN ÇINGISIZ on 22.03.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

class ExerciseSetCollectionViewCell: UICollectionViewCell {
    let weightLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.setCustomFont(size: 14, fontType: CustomFonts.conduitBold)
        return label
    }()
    
    let repCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.cellBorder
        label.setCustomFont(size: 14, fontType: CustomFonts.conduitBold)
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        [weightLabel,repCountLabel].forEach {
            addSubview($0)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init (coder) has not been implemented")
    }
    
    func setupViews(){
        weightLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, traling: nil)
        repCountLabel.anchor(top: topAnchor, leading: weightLabel.trailingAnchor, bottom: bottomAnchor, traling: nil)
    }
}
