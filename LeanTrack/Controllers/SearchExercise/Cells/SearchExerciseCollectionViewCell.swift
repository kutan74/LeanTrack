//
//  SearchExerciseCollectionViewCell.swift
//  LeanTrack
//
//  Created by KUTAN ÇINGISIZ on 17.03.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

class SearchExerciseCollectionViewCell : UICollectionViewCell {
    let exerciseTitle : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.setCustomFont(size: 18, fontType: CustomFonts.conduitBold)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init (coder) has not been implemented")
    }
    
    func setupViews(){
        addSubview(exerciseTitle)        
        exerciseTitle.anchor(top: nil, leading: leadingAnchor, bottom: nil, traling: trailingAnchor, padding: .init(top: 0, left: 11, bottom: 0, right: 0))
        exerciseTitle.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
}
