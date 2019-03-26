//
//  SearchExerciseViewController.swift
//  LeanTrack
//
//  Created by KUTAN ÇINGISIZ on 17.03.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit
import Hero

class SearchExerciseViewController: BaseViewController {
    let subView = SearchExerciseView()
    let exercises = ["Back Squat", "Front Squat", "Deadlift", "Overhead Press","Barbell Row",
                     "Bench Press", "Chin Ups", "Triceps Pulldown"]
    var searchResult: [String] = []
    weak var searchDelegate: SearchResultProtocol?
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = UIColor.background
        
        subView.searchTextField.becomeFirstResponder()
        setupViews(subView)
        setCollectionViewDatasource()
        setInitialValues()
    }
        
    func setInitialValues(){
        hero.isEnabled = true
        subView.searchTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        subView.backButton.addTarget(self, action: #selector(onDismissByBackButton), for: .touchUpInside)
    }
    
    // MARK: CollectionView Datasource
    func setCollectionViewDatasource(){
        searchResult = exercises
        subView.collectionView.dataSource = self
        subView.collectionView.delegate = self
    }
}

// MARK: Textfield Change Listener
extension SearchExerciseViewController {
    @objc func textFieldDidChange(_ textField: UITextField) {
        guard let typedText = textField.text else {
            return searchResult = exercises
        }
        
        searchResult = exercises.filter { $0.prefix(typedText.count).lowercased() == typedText.lowercased()}
        subView.collectionView.reloadData()
    }
}

// MARK: CollectionView Delegate & Datasource
extension SearchExerciseViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchResult.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SearchExerciseCollectionViewCell
        cell.exerciseTitle.text = searchResult[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        onDismissBySelection(searchResult[indexPath.row])
    }
}

// MARK: Button Actions
extension SearchExerciseViewController {
    @objc func onDismissByBackButton(){
        dismiss(animated: true, completion: nil)
    }
    
    func onDismissBySelection(_ selection : String){
        dismiss(animated: true, completion: {
            self.searchDelegate?.onExerciseSelected(selection)
        })
    }
}
