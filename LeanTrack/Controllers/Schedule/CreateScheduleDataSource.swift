//
//  CreateScheduleDataSource.swift
//  LeanTrack
//
//  Created by KUTAN ÇINGISIZ on 26.03.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

class CreateScheduleDataSource: NSObject {
    var days: [String]!
    var exercises: [WorkoutExercise] = []
    var currentDay = 0
    weak var delegate: CreateScheduleDataSourceDelegate?
    
    init(days: [String]) {
        self.days = days
    }
    
    func updateExercises(_ exercises: [WorkoutExercise], currentDayIndex: Int){
        self.exercises = exercises
        updateCurrentDay(currentDayIndex)
    }
    
    func updateCurrentDay(_ currentDay: Int){
        self.currentDay = currentDay
    }
}

// MARK: CollectionView Delegate & DataSource
/* if collectionView.tag == 0 return daysCollectionView count/data
   if collectionView.tag == 1 return exercisesCollectionView count/data
*/
extension CreateScheduleDataSource: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 0 {
            return days.count
        }else {
            return exercises.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ScheduleDayCollectionViewCell
            cell.dayLabel.text = days[indexPath.row]
            if indexPath.row == currentDay {
                cell.applySelected()
            }else {
                cell.applyDefault()
            }
            return cell
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ScheduleExerciseRowCollectionViewCell
            cell.exerciseNameLabel.text = exercises[indexPath.row].exerciseName
            return cell
        }
    }
}

// MARK: Tap Actions For Day Buttons
extension CreateScheduleDataSource {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.tag == 0 {
            delegate?.onDaySwitched(newIndex: indexPath.row)
        }else {
            delegate?.onExerciseSelected(exercise: exercises[indexPath.row])
        }
    }
}
