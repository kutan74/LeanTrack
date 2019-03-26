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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupDaysCollectionView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init (coder) has not been implemented")
    }
    
    func setupDaysCollectionView(){
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .zero
        layout.estimatedItemSize = .init(width: 60, height: 20)
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
    
}
