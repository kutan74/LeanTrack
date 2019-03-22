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
class HomeDatasource: NSObject,UICollectionViewDelegate,UICollectionViewDataSource {
    
    var segmentCollectionView: UICollectionView!
    var exercisesCollectionView: UICollectionView!
    
    var segments: [String]!
    var exercises: [Exercise]!
    weak var delegate: HomeDatasourceProtocol?
    
    init(segmentCollectionView: UICollectionView, exercisesCollectionView: UICollectionView) {
        self.segmentCollectionView = segmentCollectionView
        self.exercisesCollectionView = exercisesCollectionView
    }
    
    func setDelegates(){
        segmentCollectionView.delegate = self
        segmentCollectionView.dataSource = self
        exercisesCollectionView.delegate = self
        exercisesCollectionView.dataSource = self
    }
    
    func loadSegments(_ segments: [String]){
        self.segments = segments
    }
    
    // Add new exercise set
    func updateExercises(add exercise: Exercise){
        exercises.append(exercise)
        exercisesCollectionView.reloadData()
    }
}

extension HomeDatasource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == segmentCollectionView {
            return segments.count
        }else {
            return exercises.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == segmentCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeSegmentCollectionViewCell
            cell.segmentTitle.text = segments[indexPath.row]
            return cell
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeExerciseCollectionViewCell
            cell.exerciseNameLabel.text = exercises[indexPath.row].exerciseName
            cell.addSetButton.addTarget(self, action: #selector(onAddSetButtonTapped(_:)), for: .touchUpInside)
            return cell
        }
    }
    
    @objc func onAddSetButtonTapped(_ sender: UIButton){
        delegate?.onAddSetButtonTappedForExercise(at: sender.tag)        
    }
}
