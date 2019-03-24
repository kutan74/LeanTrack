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
    var exercises: [ExerciseHeader] = []
    var selectedExerciseIndex = 0
    
    var dataSource: HomeDatasource!
    var fireStoreLoader = FirestoreLoader()
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = UIColor.background
        
        setupViews(subView)
        setTableViewDatasource()
        setTapActions()
        setExerciseSettingsVCDelegate()
        setHeroModifiers()
    }
    
    func setTableViewDatasource(){
        dataSource = HomeDatasource(exercisesTableView: subView.tableView)
        dataSource.setCollectionViewDatasource()
        dataSource.delegate = self
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

// MARK: Display ExerciseSettingsViewController on AddSet button action
extension HomeViewController: HomeDatasourceProtocol {
    func onAddSetButtonTappedForExercise(at index: Int) {
        selectedExerciseIndex = index
        add(exerciseSettingsVC)
    }
}

// MARK: SearchResultViewController Delegate (Whenever user adds new exercises)
extension HomeViewController : SearchResultProtocol {
    func onExerciseSelected(_ exerciseName: String) {
        fireStoreLoader.createNewWorkoutSession(exerciseName: exerciseName) { (error) in
            if let err = error {
                self.displayLocalizedError(err.localizedDescription)
            }else {
                let exerciseHeader = ExerciseHeader(exerciseName: exerciseName)                
                self.exercises.append(exerciseHeader)
                self.dataSource.updateExercises(add: exerciseHeader)
            }
        }
    }
}

// MARK: ExerciseSettings ChildViewController (Exercise settings such as rep count and weight)
extension HomeViewController: ExerciseSettingsProtocol {
    func onDoneButtonTapped(weight: Double, repCount: Int) {
        exerciseSettingsVC.remove()
        
        let set = ExerciseSet(weight: weight, repCount: repCount)
        exercises[self.selectedExerciseIndex].sets.append(set)
        dataSource.setExerciseUpdateStatus(with: selectedExerciseIndex, for: true)
        
        fireStoreLoader.addWorkoutSet(workout: exercises[selectedExerciseIndex]) { (error) in
            if let err = error {
                self.displayLocalizedError(err.localizedDescription)
            }else {
                self.dataSource.updateExerciseSets(with: self.selectedExerciseIndex, for: set)
            }
        }
    }
    
    func onCancelButtonTapped() {
        exerciseSettingsVC.remove()
    }
}
