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
    let days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        setViewControllerProperties()
        setCollectionViewDataSource()
    }
    
    func setViewControllerProperties(){
        setupViews(subView)
        title = "SCHEDULE"
    }
    
    func setCollectionViewDataSource(){
        subView.daysCollectionView.delegate = self
        subView.daysCollectionView.dataSource = self
        subView.daysCollectionView.scrollToItem(at: IndexPath(row: 3, section: 0), at: .right, animated: false)
    }
}

extension CreateScheduleViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return days.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ScheduleDayCollectionViewCell
        cell.dayLabel.text = days[indexPath.row]
        return cell
    }
}
