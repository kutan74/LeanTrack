//
//  HomeDatasource.swift
//  LeanTrack
//
//  Created by KUTAN ÇINGISIZ on 22.03.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit
import DZNEmptyDataSet

class HomeDatasource: NSObject{
    var exercisesTableView: UITableView!    
    var exercises: [ExerciseHeader] = []
    weak var delegate: HomeDatasourceProtocol?
    
    init(exercisesTableView: UITableView) {
        self.exercisesTableView = exercisesTableView
    }
    
    func setCollectionViewDatasource(){
        exercisesTableView.delegate = self
        exercisesTableView.dataSource = self
        exercisesTableView.emptyDataSetSource = self
        exercisesTableView.emptyDataSetDelegate = self
    }
    
    func addNewExercise(add exercise: ExerciseHeader){
        exercises.append(exercise)
        exercisesTableView.reloadData()
    }
    
    func removeExercise(at index: Int){
        exercises.remove(at: index)
        exercisesTableView.reloadData()
    }

    func updateExerciseSets(with exerciseIndex: Int, for exercise: ExerciseSet){
        exercises[exerciseIndex].setUpdateStatus(false)
        exercises[exerciseIndex].sets.append(exercise)
        exercisesTableView.reloadData()
    }
    
    func setExerciseUpdateStatus(with index: Int, for status: Bool){
        exercises[index].setUpdateStatus(status)
        exercisesTableView.reloadData()
    }
}

// MARK: UITableViewDelegate & DataSource
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
        cell.removeExerciseButton.addTarget(self, action: #selector(onRemoveButtonTapped(_:)), for: .touchUpInside)
        cell.setCollectionViewDataSourceDelegate(self, forRow: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(75 + (exercises[indexPath.row].sets.count * 20))
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10.0
    }
    
    @objc func onAddSetButtonTapped(_ sender: UIButton) {
        delegate?.onAddSetButtonTappedForExercise(at: sender.tag)
    }
    
    @objc func onRemoveButtonTapped(_ sender: UIButton) {
        delegate?.onRemoveButtonTapped(at: sender.tag)
    }
}

// MARK: TableViewCell child CollectionViewDelegate & DataSource
extension HomeDatasource: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {        
        return exercises[collectionView.tag].sets.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ExerciseSetCollectionViewCell
        let set = exercises[collectionView.tag].sets[indexPath.row]
        cell.weightLabel.text = String(set.weight)
        cell.repCountLabel.text = String(set.repCount) + " reps"
        cell.setNeedsLayout()
        return cell
    }
}

extension HomeDatasource: DZNEmptyDataSetSource,DZNEmptyDataSetDelegate {
    func title(forEmptyDataSet scrollView: UIScrollView) -> NSAttributedString? {
        let str = "Empty Workout Session"
        let attrs = [NSAttributedString.Key.font: UIFont(name: "ConduitITC-Bold", size: 18), NSAttributedString.Key.foregroundColor: UIColor.white]
        return NSAttributedString(string: str, attributes: attrs as [NSAttributedString.Key : Any])
    }
    
    func description(forEmptyDataSet scrollView: UIScrollView) -> NSAttributedString? {
        let str = "Start your workout session by searcing an exercise"
        let attrs = [NSAttributedString.Key.font: UIFont(name: "ConduitITC-Bold", size: 14), NSAttributedString.Key.foregroundColor: UIColor.white]
        return NSAttributedString(string: str, attributes: attrs as [NSAttributedString.Key : Any])
    }
    
    func image(forEmptyDataSet scrollView: UIScrollView) -> UIImage? {
        return UIImage(named: "weight")
    }
}
