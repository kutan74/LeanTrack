//
//  CreateScheduleViewController.swift
//  LeanTrack
//
//  Created by KUTAN ÇINGISIZ on 26.03.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

class CreateScheduleViewController: BaseViewController {
    final let days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    let subView = CreateScheduleView()
    var dataSource: CreateScheduleDataSource!
    var currentDayIndex = 0
    var schedule = WorkoutSchedule()
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        setViewControllerProperties()
        setCollectionViewDataSource()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        showAddExerciseButton(true)
        addExerciseButton.setTitle("Add Exercise", for: .normal)
    }
    
    func setViewControllerProperties(){
        setupViews(subView)
        setupAddExerciseButton()
        delegate = self
        title = "SCHEDULE"
    }
    
    func setCollectionViewDataSource(){
        dataSource = CreateScheduleDataSource(days: self.days)
        dataSource.delegate = self
        subView.daysCollectionView.delegate = dataSource
        subView.daysCollectionView.dataSource = dataSource
        subView.exercisesCollectionView.delegate = dataSource
        subView.exercisesCollectionView.dataSource = dataSource
        subView.daysCollectionView.tag = 0
        subView.exercisesCollectionView.tag = 1
        subView.daysCollectionView.scrollToItem(at: IndexPath(row: 3, section: 0), at: .right, animated: false)
    }
}

// MARK: Router Delegate
extension CreateScheduleViewController: BaseViewControllerDelegate {
    override func onAddExerciseButtonTapped() {
        showAddExerciseButton(false)
        let controller = SearchExerciseViewController()
        controller.searchDelegate = self
        navigationController?.pushViewController(controller, animated: true)        
    }
}

// MARK: Current Day Switches
extension CreateScheduleViewController: CreateScheduleDataSourceDelegate {
    func onExerciseDetailsTapped(exercise: WorkoutExercise) {
        addExerciseButton.setTitle("Save", for: .normal)
        let controller = ExerciseDetailsViewController(selectedExercise: exercise)
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func onDaySwitched(newIndex: Int) {
        guard newIndex != currentDayIndex else {
            return
        }
        
        currentDayIndex = newIndex        
        dataSource.updateExercises(schedule.days[currentDayIndex]!, currentDayIndex: currentDayIndex)
        subView.exercisesCollectionView.reloadData()
        subView.daysCollectionView.reloadData()
    }
}

// MARK: Exercise Added By User -> Update schedule
extension CreateScheduleViewController: SearchResultProtocol {
    func onExerciseSelected(_ exerciseName: String) {
        schedule.addNewExercise(to: currentDayIndex, with: exerciseName)
        dataSource.updateExercises(schedule.days[currentDayIndex]!, currentDayIndex: currentDayIndex)
        subView.exercisesCollectionView.reloadData()
    }
}
