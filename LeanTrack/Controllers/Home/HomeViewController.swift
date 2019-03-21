//
//  HomeViewController.swift
//  LeanTrack
//
//  Created by KUTAN ÇINGISIZ on 16.03.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit
import Hero

class HomeViewController: BaseViewController {    
    let subView = HomeView()
    let segmentCells = ["LIFT", "REPORTS"]
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = UIColor.background
        
        setupViews(subView)
        setCollectionViewDatasource()
        setTapActions()
        setHeroModifiers()
    }
    
    // MARK: Datasource
    func setCollectionViewDatasource(){
        subView.segmentMenu.collectionView.delegate = self
        subView.segmentMenu.collectionView.dataSource = self
        
        subView.collectionView.dataSource = self
        subView.collectionView.delegate = self
    }
    
    // MARK: Tap Actions
    func setTapActions(){
        let searchTextFieldTapGesture = UITapGestureRecognizer(target: self, action: #selector(onSearchTapped))
        subView.searchTextField.isUserInteractionEnabled = true
        subView.searchTextField.addGestureRecognizer(searchTextFieldTapGesture)
    }
    
    func setHeroModifiers(){
        view.hero.id = "homeVC"
    }
}

// MARK: CollectionView Delegate & Datasource
extension HomeViewController: UICollectionViewDataSource,UICollectionViewDelegate {
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
        controller.delegate = self
        self.hero.modalAnimationType = .selectBy(presenting:.fade, dismissing:.fade)
        self.present(controller, animated: true, completion: nil)
    }
}

// MARK: SearchResultViewController Delegate
extension HomeViewController : SearchResultProtocol {
    func onExerciseSelected(_ exercise: String) {
        
    }
}
