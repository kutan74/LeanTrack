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
    var exercises: [Exercise] = []
    
    let exerciseSettingsVC = ExerciseSettingsViewController()
    
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
        if collectionView == subView.segmentMenu.collectionView {
            return 2
        }else {
            return exercises.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == subView.segmentMenu.collectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeSegmentCollectionViewCell
            cell.segmentTitle.text = segmentCells[indexPath.row]
            return cell
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeExerciseCollectionViewCell
            cell.exerciseNameLabel.text = exercises[indexPath.row].exerciseName
            cell.addSetButton.addTarget(self, action: #selector(onAddSetButtonTapped(_:)), for: .touchUpInside)
            return cell
        }
    }
    
    @objc func onAddSetButtonTapped(_ sender: UIButton){
        //let selectedExerciseName = exercises[sender.tag]
        exerciseSettingsVC.delegate = self
        add(exerciseSettingsVC)
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
        exercises.append(Exercise(exerciseName: exercise))
        subView.collectionView.reloadData()
    }
}

// MARK: ExerciseSettings ChildViewController
extension HomeViewController: ExerciseSettingsProtocol {
    func onCancelButtonTapped() {
        exerciseSettingsVC.remove()
    }
}
