//
//  SearchExerciseView.swift
//  LeanTrack
//
//  Created by KUTAN ÇINGISIZ on 17.03.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

class SearchExerciseView: UIView {
    let backButton: UIButton = {
       
        let button = UIButton()
        button.setImage(UIImage(named: "back"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        button.imageView?.clipsToBounds = true
        return button
        
    }()
    
    var searchTextField = HomeSearchTextField()
    var collectionView: UICollectionView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupCollectionViewLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init (coder) has not been implemented")
    }
    
    func setupViews(){
        [backButton,searchTextField].forEach {
            addSubview($0)
        }
        
        backButton.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, traling: nil, padding: .init(top: 26, left: 14, bottom: 0, right: 0), size: .init(width: 25, height: 25))
        searchTextField.anchor(top: backButton.bottomAnchor, leading: leadingAnchor, bottom: nil, traling: trailingAnchor, padding: .init(top: 31, left: 26, bottom: 0, right: 26),size: .init(width: 0, height: 20))
    }
    
    func setupCollectionViewLayout(){
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: UIScreen.main.bounds.size.width - 44, height: 45)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = .zero
        
        collectionView = UICollectionView(frame: self.frame, collectionViewLayout: layout)
        addSubview(collectionView)
        
        collectionView.register(SearchExerciseCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = UIColor.background
        collectionView.anchor(top: searchTextField.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, traling: trailingAnchor, padding: .init(top: 29, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 62))
        
    }    
}
