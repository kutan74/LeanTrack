//
//  CreateScheduleViewController.swift
//  LeanTrack
//
//  Created by KUTAN ÇINGISIZ on 26.03.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

class CreateScheduleViewController: BaseViewController {
    
    let subView = CreateScheduleView()
    var dataSource: CreateScheduleDataSource!
    let days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        setViewControllerProperties()
        setCollectionViewDataSource()
    }
    
    func setViewControllerProperties(){
        setupViews(subView)
        setupAddExerciseButton()
        delegate = self
        title = "SCHEDULE"
    }
    
    func setCollectionViewDataSource(){
        dataSource = CreateScheduleDataSource(days: self.days)
        subView.daysCollectionView.delegate = dataSource
        subView.daysCollectionView.dataSource = dataSource
    }
}

extension CreateScheduleViewController: BaseViewControllerDelegate {
    override func onAddExerciseButtonTapped() {
        let controller = SearchExerciseViewController()
        navigationController?.pushViewController(controller, animated: true)        
    }
}
