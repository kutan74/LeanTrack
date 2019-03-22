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
    var exercises : Exercises!
    var selectedExerciseIndex = 0
    
    var dataSource: HomeDatasource!
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = UIColor.background
        
        setupViews(subView)
        setCollectionViewDatasource()
        setTapActions()
        setExerciseSettingsVCDelegate()
        setHeroModifiers()
    }
    
    func setCollectionViewDatasource(){
        dataSource = HomeDatasource(segmentCollectionView: subView.segmentMenu.collectionView, exercisesCollectionView: subView.collectionView)
        dataSource.setCollectionViewDatasource()
        dataSource.delegate = self
        dataSource.loadSegments(segmentCells)
    }
    
    func setTapActions(){
        let searchTextFieldTapGesture = UITapGestureRecognizer(target: self, action: #selector(onSearchTapped))
        subView.searchTextField.isUserInteractionEnabled = true
        subView.searchTextField.addGestureRecognizer(searchTextFieldTapGesture)
    }
    
    func setHeroModifiers(){
        view.hero.id = "homeVC"
    }
    
    func setExerciseSettingsVCDelegate(){
        exerciseSettingsVC.delegate = self
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

// MARK: HomeDatasource delegate methdos
extension HomeViewController: HomeDatasourceProtocol {
    func onAddSetButtonTappedForExercise(at index: Int) {
        selectedExerciseIndex = index
        add(exerciseSettingsVC)
    }
}

// MARK: SearchResultViewController Delegate (Whenever user adds new exercises)
extension HomeViewController : SearchResultProtocol {
    func onExerciseSelected(_ exercise: String) {
        //let exercise = Exercise(cellType: CellType.exercise, item: ExerciseHeader(exerciseName: exercise))
        let exercise = Exercise<ExerciseHeader>(cellType: CellType.exercise, item: ExerciseHeader(exerciseName: exercise))
        exercises.exercises.append(exercise as! Exercise<Any>)  
        //exercises.exercises.append(exercise as! ExerciseHeader)
        //dataSource.updateExercises(add: ExerciseHeader(exerciseName: exercise))
    }
}

// MARK: ExerciseSettings ChildViewController (Exercise settings like rep count and weight)
extension HomeViewController: ExerciseSettingsProtocol {
    func onDoneButtonTapped(weight: Double, repCount: Int) {
        //exercises[selectedExerciseIndex].sets?.append(ExerciseSet(weight: weight, repCount: repCount))
        dataSource.updateExerciseSets(with: selectedExerciseIndex, for: ExerciseSet(weight: weight, repCount: repCount))
        exerciseSettingsVC.remove()
    }
    
    func onCancelButtonTapped() {
        exerciseSettingsVC.remove()
    }
}
