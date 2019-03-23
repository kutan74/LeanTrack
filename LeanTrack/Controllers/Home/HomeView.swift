//
//  HomeView.swift
//  LeanTrack
//
//  Created by KUTAN ÇINGISIZ on 16.03.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

class HomeView: UIView {
    let segmentMenu = HomeSegmentView()
    let searchTextField = HomeSearchTextField()
    
    var collectionView: UICollectionView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        [segmentMenu,searchTextField].forEach {
            addSubview($0)
        }
        setupViews()
        setupCollectionViewLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init (coder) has not been implemented")
    }
    
    func setupViews(){
        segmentMenu.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, traling: trailingAnchor)
        searchTextField.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, traling: trailingAnchor, padding: .init(top: 41, left: 26, bottom: 0, right: 26),size: .init(width: 0, height: 20))
    }
    
    func setupCollectionViewLayout(){
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .zero
        layout.estimatedItemSize = .init(width: UIScreen.main.bounds.size.width - 46, height: 120)
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .vertical
        layout.sectionInset = .zero
        
        collectionView = UICollectionView(frame: self.frame, collectionViewLayout: layout)
        addSubview(collectionView)
        collectionView.register(HomeExerciseCollectionViewCell.self, forCellWithReuseIdentifier: "cell")    
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        
        collectionView.anchor(top: searchTextField.bottomAnchor, leading: leadingAnchor, bottom: nil, traling: trailingAnchor, padding: .init(top: 30, left: 22, bottom: 30, right: 22), size: .init(width: 0, height: UIScreen.main.bounds.size.height - 70))
    }
}

class HomeSearchTextField: UITextField {
    let divider: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white.withAlphaComponent(0.23)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(divider)
        setupTextFieldProperties()
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init (coder) has not been implemented")
    }
    
    func setupTextFieldProperties(){
        clearButtonMode = .whileEditing
        textColor = .white
        attributedPlaceholder = NSAttributedString(string:"Do you even lift bro ?", attributes:[NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.23),NSAttributedString.Key.font : UIFont(name: "ConduitITC-Bold", size: 12)!])
        font = UIFont(name: "ConduitITC-Bold", size: 12)!
    }
    
    func setupViews(){
        divider.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, traling: trailingAnchor, padding: .zero, size: .init(width: 0, height: 1))
    }    
}
