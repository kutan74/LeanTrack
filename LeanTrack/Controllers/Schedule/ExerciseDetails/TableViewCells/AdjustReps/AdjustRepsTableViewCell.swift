//
//  AdjustRepsTableViewCell.swift
//  LeanTrack
//
//  Created by KUTAN ÇINGISIZ on 28.03.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

/* TableViewCell which contains UICollectionView
 Main usage for displaying exercise sets dynamically
*/
class AdjustRepsTableViewCell: UITableViewCell {
    var collectionView: UICollectionView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layoutCollectionView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func layoutCollectionView(){
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: UIScreen.main.bounds.size.width - 44, height: 30)
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .vertical
        layout.sectionInset = .zero
        
        collectionView = UICollectionView(frame: self.frame, collectionViewLayout: layout)
        collectionView.register(MultipleInputCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        addSubview(collectionView)
        
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, traling: trailingAnchor)
    }
}

// MARK: CollectionViewCell DataSource
/* In order to manage all TableView and CollectionView in one single class, I set CollectionViews delegate and datasource to it's parent dataSource
 in this case it'd be ExerciseDetailsDataSource
*/
extension AdjustRepsTableViewCell {
    func setCollectionViewDataSourceDelegate<D: UICollectionViewDataSource & UICollectionViewDelegate>(_ dataSourceDelegate: D, forRow row: Int) {
        collectionView.delegate = dataSourceDelegate
        collectionView.dataSource = dataSourceDelegate
        collectionView.tag = row
        collectionView.reloadData()
    }
}
