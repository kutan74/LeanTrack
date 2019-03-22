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
    let exerciseSettingsVC = ExerciseSettingsViewController()
    
    let segmentCells = ["LIFT", "REPORTS"]
    var exercises: [Exercise] = []
    var selectedExerciseIndex = 0
    
    var dataSource: HomeDatasource!
    
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
        dataSource = HomeDatasource(segmentCollectionView: subView.segmentMenu.collectionView, exercisesCollectionView: subView.collectionView)
        dataSource.setDelegates()
        dataSource.delegate = self
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

extension HomeViewController: HomeDatasourceProtocol {
    func onAddSetButtonTappedForExercise(at index: Int) {
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
    func onDoneButtonTapped(weight: Double, repCount: Int) {
        exercises[selectedExerciseIndex].sets?.append(ExerciseSet(weight: weight, repCount: repCount))
    }
    
    func onCancelButtonTapped() {
        exerciseSettingsVC.remove()
    }
}
