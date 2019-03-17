//
//  SearchExerciseViewController.swift
//  LeanTrack
//
//  Created by KUTAN ÇINGISIZ on 17.03.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

class SearchExerciseViewController : BaseViewController {
    
    let subView = SearchExerciseView()
    let exercises = ["Back Squat", "Front Squat", "Deadlift", "Overhead Press","Barbell Row",
                     "Bench Press", "Chin Ups", "Triceps Pulldown"]
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = UIColor.background
        
        setupViews(subView)
    }
    
}

extension SearchExerciseViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SearchExerciseCollectionViewCell
        return cell
    }
    
}
