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
        label.setCustomFont(size: 16, fontType: CustomFonts.conduitBold)
        return label
    }()
    
    let repCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.tangerine
        label.setCustomFont(size: 16, fontType: CustomFonts.conduitBold)
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        [weightLabel,repCountLabel].forEach {
            addSubview($0)
        }
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init (coder) has not been implemented")
    }
    
    func setupViews(){
        weightLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, traling: nil, padding: .init(top: 0, left: 17, bottom: 0, right: 0))
        repCountLabel.anchor(top: topAnchor, leading: weightLabel.trailingAnchor, bottom: bottomAnchor, traling: nil, padding: .init(top: 0, left: 17, bottom: 0, right: 0))
    }
}
