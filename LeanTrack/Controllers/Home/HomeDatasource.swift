//
//  HomeDatasource.swift
//  LeanTrack
//
//  Created by KUTAN ÇINGISIZ on 22.03.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

/**
 We have two different collectionviews, 1st for loading segments at the bottom of the page
 Other to load added exercises by the user
 */
class HomeDatasource: NSObject{
    var exercisesTableView: UITableView!
    var workoutSession = WorkoutSession()
    var exercises: [ExerciseHeader] = []
    weak var delegate: HomeDatasourceProtocol?
    
    init(exercisesTableView: UITableView) {
        self.exercisesTableView = exercisesTableView
    }
    
    func setCollectionViewDatasource(){
        exercisesTableView.delegate = self
        exercisesTableView.dataSource = self
    }
    
    func updateExercises(add exercise: ExerciseHeader){
        exercises.append(exercise)
        exercisesTableView.reloadData()
    }

    func updateExerciseSets(with exerciseIndex: Int, for exercise: ExerciseSet){
        exercises[exerciseIndex].sets.append(exercise)
        exercisesTableView.reloadData()
    }
}

extension HomeDatasource: UITableViewDelegate,UITableViewDataSource  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercises.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeExerciseCollectionViewCell
        let exercise = exercises[indexPath.row]
        cell.exerciseNameLabel.text = exercise.exerciseName
        cell.addSetButton.tag = indexPath.row
        cell.addSetButton.addTarget(self, action: #selector(onAddSetButtonTapped(_:)), for: .touchUpInside)
        cell.setCollectionViewDataSourceDelegate(self, forRow: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(75 + (exercises[indexPath.row].sets.count * 20))
        // Or customize the way you want using the indexPath
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10.0
    }
    
    @objc func onAddSetButtonTapped(_ sender: UIButton){
        delegate?.onAddSetButtonTappedForExercise(at: sender.tag)
    }
}

extension HomeDatasource: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {        
        return exercises[collectionView.tag].sets.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ExerciseSetCollectionViewCell
        let set = exercises[collectionView.tag].sets[indexPath.row]
        cell.weightLabel.text = String(set.weight)
        cell.repCountLabel.text = String(set.repCount)
        cell.setNeedsLayout()
        return cell
    }
    
    
}
