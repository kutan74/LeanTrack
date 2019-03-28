//
//  ExerciseDetailsViewController.swift
//  LeanTrack
//
//  Created by KUTAN ÇINGISIZ on 27.03.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

class ExerciseDetailsViewController: BaseViewController {
    
    let subView = ExerciseDetailsView()
    let selectedExercise: WorkoutExercise!
    var dataSource: ExerciseDetailsDataSource!
    
    var placeholderSchedule = CreateSchedulePlaceholder()
    
    init(selectedExercise: WorkoutExercise) {
        self.selectedExercise = selectedExercise
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init (coder) has not been implemented")
    }
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
                
        setupViews(subView)
        setViewControllerProperties()
        setTableViewDataSource()
    }
    
    func setViewControllerProperties(){
        title = selectedExercise.exerciseName
    }
    
    func setTableViewDataSource(){
        dataSource = ExerciseDetailsDataSource(exerciseName: selectedExercise.exerciseName, placeholderSchedule: placeholderSchedule)
        dataSource.delegate = self
        subView.tableView.delegate = dataSource
        subView.tableView.dataSource = dataSource
    }
}

// MARK: ExerciseDetailsDatasource Delegate Methods
extension ExerciseDetailsViewController: ExerciseDetailsDataSourceDelegate {
    func didConvertToKilogramSelected() {
        placeholderSchedule.updateMetricUnit(to: .kilograms)
        dataSource.updatePlaceholderSchedule(placeholderSchedule: placeholderSchedule)
        subView.tableView.reloadData()
    }
    
    func didConvertToLbsSelected() {
        placeholderSchedule.updateMetricUnit(to: .pounds)
        dataSource.updatePlaceholderSchedule(placeholderSchedule: placeholderSchedule)
        subView.tableView.reloadData()
    }
    
    func didRPTSelected() {
        
    }
    
    func didStrongmanSelected() {
        
    }
    
    func didMaximumWeightEntered(maxWeight: Double) {
        placeholderSchedule.exerciseMaxWeight = maxWeight
    }
    
    func didAddSetButtonTapped() {
        placeholderSchedule.sets.append(WorkoutExerciseSet(weight: 0, repCount: 0))
        dataSource.updatePlaceholderSchedule(placeholderSchedule: placeholderSchedule)
        subView.tableView.reloadData()
    }
    
    func didSetWeightChanged(at index: Int, newValue: String) {
        
    }
    
    func didSetRepChanged(at index: Int, newValue: String) {
        
    }
}
