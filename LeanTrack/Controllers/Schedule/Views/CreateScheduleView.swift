//
//  CreateScheduleView.swift
//  LeanTrack
//
//  Created by KUTAN ÇINGISIZ on 26.03.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

class CreateScheduleView: UIView {
    
    var daysCollectionView: UICollectionView!
    var exercisesCollectionView: UICollectionView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupDaysCollectionView()
        setupExercisesCollectionView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init (coder) has not been implemented")
    }
    
    func setupDaysCollectionView(){
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: 100, height: 35)
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        layout.scrollDirection = .horizontal
        layout.sectionInset = .zero
        
        daysCollectionView = UICollectionView(frame: self.frame, collectionViewLayout: layout)
        addSubview(daysCollectionView)
        daysCollectionView.register(ScheduleDayCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        daysCollectionView.backgroundColor = .clear
        daysCollectionView.showsHorizontalScrollIndicator = false
        
        daysCollectionView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, traling: trailingAnchor, padding: .init(top: 12, left: 8, bottom: 0, right: 8), size: .init(width: 0, height: 30))
    }
    
    func setupExercisesCollectionView(){
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: UIScreen.main.bounds.size.width - 40, height: 30)
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        layout.scrollDirection = .vertical
        layout.sectionInset = .zero        
        
        exercisesCollectionView = UICollectionView(frame: self.frame, collectionViewLayout: layout)
        addSubview(exercisesCollectionView)
        exercisesCollectionView.register(ScheduleExerciseRowCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        exercisesCollectionView.backgroundColor = .clear
        exercisesCollectionView.showsHorizontalScrollIndicator = false
        
        exercisesCollectionView.anchor(top: daysCollectionView.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, traling: trailingAnchor, padding: .init(top: 45, left: 0, bottom: 0, right: 0))
    }
    
}
