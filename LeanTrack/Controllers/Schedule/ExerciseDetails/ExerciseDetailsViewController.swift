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
        dataSource = ExerciseDetailsDataSource(exerciseName: selectedExercise.exerciseName)
        dataSource.delegate = self
        subView.tableView.delegate = dataSource
        subView.tableView.dataSource = dataSource
    }
}

// MARK: ExerciseDetailsDatasource Delegate Methods
extension ExerciseDetailsViewController: ExerciseDetailsDataSourceDelegate {
    func onConvertToKilogramSelected() {
        placeholderSchedule.updateMetricUnit(to: .kilogram)
    }
    
    func onConvertToLbsSelected() {
        placeholderSchedule.updateMetricUnit(to: .lbs)
    }
    
    func onRPTSelected() {
        
    }
    
    func onStrongmanSelected() {
        
    }
    
    func onMaximumWeightEntered(maxWeight: Double) {
        placeholderSchedule.exerciseMaxWeight = maxWeight
        print("max weight for \(selectedExercise.exerciseName!) is \(placeholderSchedule.exerciseMaxWeight) in \(placeholderSchedule.metricUnit)")
    }
    
    func onSetCountEntered(setCount: Int) {
        
    }
}
