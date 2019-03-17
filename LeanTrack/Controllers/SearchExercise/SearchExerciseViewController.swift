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
    var searchResult : [String] = []
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = UIColor.background
        
        setupViews(subView)
        setCollectionViewDatasource()
        setTextFieldDelegate()
    }
    
    // MARK: CollectionView Datasource
    func setCollectionViewDatasource(){
        subView.collectionView.dataSource = self
        subView.collectionView.delegate = self
    }
    
    func setTextFieldDelegate(){
        subView.searchTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
}

// MARK: Textfield Change Listener
extension SearchExerciseViewController {
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        
        searchResult = []
        
        guard let typedText = textField.text else {
            return
        }
        
        searchResult = exercises.filter { $0.prefix(typedText.count).lowercased() == typedText.lowercased()}
        subView.collectionView.reloadData()
    }
    
}

// MARK: CollectionView Delegate & Datasource
extension SearchExerciseViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchResult.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SearchExerciseCollectionViewCell
        cell.exerciseTitle.text = searchResult[indexPath.row]
        return cell
    }    
}
