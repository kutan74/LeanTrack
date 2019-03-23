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
    //var exercises : [Exercise<Any>]!
    var workoutSession = WorkoutSession()
    var selectedExerciseIndex = 0
    
    var dataSource: HomeDatasource!
    
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
        let exercise = ExerciseHeader(exerciseName: exercise)
        dataSource.updateExercises(add: exercise)
    }
}

// MARK: ExerciseSettings ChildViewController (Exercise settings such as rep count and weight)
extension HomeViewController: ExerciseSettingsProtocol {
    func onDoneButtonTapped(weight: Double, repCount: Int) {
        let exercise = ExerciseSet(weight: weight, repCount: repCount)
        dataSource.updateExerciseSets(with: selectedExerciseIndex, for: exercise)
        exerciseSettingsVC.remove()
        //dataSource.up
        /*
        let exercise = ExerciseSet(weight: weight, repCount: repCount)
        var exerciseSet = Workout<Any>()
        exerciseSet.load(exercise, cellType: CellType.set)
        workoutSession.workouts.append(exerciseSet)        
        dataSource.updateExercises(add: exerciseSet)
        exerciseSettingsVC.remove()
        */
    }
    
    func setAddedExerciseIndex(){
        //let existingExerciseSetCount = workoutSession.workouts
    }
    
    func onCancelButtonTapped() {
        exerciseSettingsVC.remove()
    }
}
