//
//  HomeViewController.swift
//  LeanTrack
//
//  Created by KUTAN ÇINGISIZ on 16.03.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

class HomeViewController : BaseViewController {
    
    let subView = HomeView()
    let segmentCells = ["LIFT", "REPORTS"]
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = UIColor.background
        
        setupViews(subView)
        setCollectionViewDatasource()
        setTapActions()
    }
    
    // MARK: Datasource
    func setCollectionViewDatasource(){
        subView.segmentMenu.collectionView.delegate = self
        subView.segmentMenu.collectionView.dataSource = self
    }
    
    // MARK: Tap Actions
    func setTapActions(){
        
        let searchTextFieldTapGesture = UITapGestureRecognizer(target: self, action: #selector(onSearchTapped))
        subView.searchTextField.isUserInteractionEnabled = true
        subView.searchTextField.addGestureRecognizer(searchTextFieldTapGesture)
        
    }
    
}

// MARK: CollectionView Delegate & Datasource
extension HomeViewController : UICollectionViewDataSource,UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeSegmentCollectionViewCell
        cell.segmentTitle.text = segmentCells[indexPath.row]
        return cell
    }
    
}

// MARK: Tap Methods
extension HomeViewController {
    
    @objc func onSearchTapped(){
        let controller = SearchExerciseViewController()
        self.show(controller, sender: self)
    }
    
}
