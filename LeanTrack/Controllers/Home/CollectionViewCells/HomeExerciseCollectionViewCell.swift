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
        button.titleLabel?.setCustomFont(size: 12, fontType: CustomFonts.conduitBold)
        button.layer.cornerRadius = 3
        button.clipsToBounds = true
        button.layer.borderColor = UIColor.buttonBorder.cgColor
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
        setupBackgroundProperties()
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init (coder) has not been implemented")
    }
    
    func setupBackgroundProperties(){
        layer.cornerRadius = 3
        layer.borderColor = UIColor.cellBorder.cgColor
        layer.borderWidth = 1.0
        clipsToBounds = true
    }
    
    func setupViews(){
        exerciseNameLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, traling: nil, padding: .init(top: 15, left: 17, bottom: 0, right: 0))
        addSetButton.anchor(top: nil, leading: nil, bottom: nil, traling: trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 14), size: .init(width: 55, height: 26))
        addSetButton.centerYAnchor.constraint(equalTo: exerciseNameLabel.centerYAnchor).isActive = true
    }
    
    func setupCollectionViewLayout(){
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: UIScreen.main.bounds.size.width - 40, height: 20)
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 0
        layout.sectionInset = .zero
        
        collectionView = UICollectionView(frame: self.frame, collectionViewLayout: layout)
        collectionView.register(ExerciseSetCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        addSubview(collectionView)
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.anchor(top: exerciseNameLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, traling: trailingAnchor, padding: .init(top: 12, left: 18, bottom: 12, right: 0))
    }
}

extension HomeExerciseCollectionViewCell {
    func addNewSet(weight: Double, repCount: Int){
        
    }
}
