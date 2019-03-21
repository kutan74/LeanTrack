//
//  HomeExerciseCollectionViewCell.swift
//  LeanTrack
//
//  Created by KUTAN ÇINGISIZ on 21.03.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

class HomeExerciseCollectionViewCell: UICollectionViewCell {
    let exerciseNameLabel: UILabel = {
        let label = UILabel()
        label.setCustomFont(size: 18, fontType: CustomFonts.conduitBold)
        label.textColor = .white
        return label
    }()
    
    let addSetButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add Set", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 3
        button.clipsToBounds = true
        button.layer.borderColor = UIColor.background.withAlphaComponent(0.3).cgColor
        button.layer.borderWidth = 1.0
        button.backgroundColor = .clear
        return button
    }()
    
    // To display sets and reps
    var collectionView: UICollectionView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        [exerciseNameLabel,addSetButton].forEach {
            addSubview($0)
        }
        setupViews()
        setupCollectionViewLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init (coder) has not been implemented")
    }
    
    func setupViews(){
        exerciseNameLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, traling: nil, padding: .init(top: 15, left: 17, bottom: 0, right: 0))
        addSetButton.anchor(top: nil, leading: nil, bottom: nil, traling: trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 8), size: .init(width: 55, height: 26))
        addSetButton.centerYAnchor.constraint(equalTo: exerciseNameLabel.centerYAnchor).isActive = true
        
        collectionView.anchor(top: exerciseNameLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, traling: trailingAnchor, padding: .init(top: 12, left: 17, bottom: 12, right: 17))
    }
    
    func setupCollectionViewLayout(){
        let layout = createUICollectionViewLayout(lineSpacing: 1, itemSize: .init(width: UIScreen.main.bounds.size.width - 80, height: 20))
        collectionView = UICollectionView(frame: self.frame, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
    }
}

extension HomeExerciseCollectionViewCell {
    
}
