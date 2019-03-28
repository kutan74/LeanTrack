//
//  ExerciseDetailsDataSource.swift
//  LeanTrack
//
//  Created by KUTAN ÇINGISIZ on 27.03.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

/* Responsible for controlling all TableViews & CollectionViews Datasource / Delegates
 TableView has a dynamic cell height expect for the indexPath 6 which is AdjustReps section
 Because it should be dynamic depends on how many sets users might want to add
*/
class ExerciseDetailsDataSource: NSObject {
    var placeholderSchedule: CreateSchedulePlaceholder!
    var exerciseName: String!
    weak var delegate: ExerciseDetailsDataSourceDelegate?
    
    init(exerciseName: String, placeholderSchedule: CreateSchedulePlaceholder) {
        self.exerciseName = exerciseName
        self.placeholderSchedule = placeholderSchedule
    }
    
    func updatePlaceholderSchedule(placeholderSchedule: CreateSchedulePlaceholder){
        self.placeholderSchedule = placeholderSchedule
    }
}

// MARK: TableView Datasource & Delegate
extension ExerciseDetailsDataSource: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "titleCell", for: indexPath) as! ExerciseDetailsTitleTableViewCell
            cell.titleLabel.text = "Metric unit?"
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "multipleButtonsCell", for: indexPath) as! MultipleButtonsCell
            cell.primaryButton.addTarget(self, action: #selector(onConvertToKilogramSelected), for: .touchUpInside)
            cell.secondaryButton.addTarget(self, action: #selector(onConvertToLbsSelected), for: .touchUpInside)
            cell.primaryButton.setTitle("KG", for: .normal)
            cell.secondaryButton.setTitle("LBS", for: .normal)
            
            if placeholderSchedule.metricUnit == .kilograms {
                cell.primaryButton.setSelectionStatus(true)
                cell.secondaryButton.setSelectionStatus(false)
            }else {
                cell.secondaryButton.setSelectionStatus(true)
                cell.primaryButton.setSelectionStatus(false)
            }
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "titleCell", for: indexPath) as! ExerciseDetailsTitleTableViewCell
            cell.titleLabel.text = "Enter your maximum weight for \(exerciseName!)"
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "inputCell", for: indexPath) as! InputWithButtonsTableViewCell
            cell.cellInputView.text = String(placeholderSchedule.exerciseMaxWeight)
            cell.cellInputView.addTarget(self, action: #selector(maximumWeightDidChange(_:)), for: .editingChanged)            
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "titleCell", for: indexPath) as! ExerciseDetailsTitleTableViewCell
            cell.titleLabel.text = "Adjust your reps"
            cell.enablePrimaryButton(title: "Add Set")
            cell.primaryButton.addTarget(self, action: #selector(onAddSetButtonTapped), for: .touchUpInside)
            return cell
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: "multipleInputsCell", for: indexPath) as! AdjustRepsTableViewCell
            cell.setCollectionViewDataSourceDelegate(self, forRow: indexPath.row)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 5 {
            return CGFloat(40 + (placeholderSchedule.sets.count * 30) + ((placeholderSchedule.sets.count - 1) * 8))
        }else {
            return CGFloat(36)
        }
    }        
}

// MARK: AdjustRepsCell child CollectionView Delegate & Datasource
extension ExerciseDetailsDataSource: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return placeholderSchedule.sets.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MultipleInputCollectionViewCell
        cell.weightInput.tag = indexPath.row
        cell.repInput.tag = indexPath.row
        cell.weightInput.applyPlaceHolderWithString("weight")
        cell.repInput.applyPlaceHolderWithString("reps")
        cell.weightInput.addTarget(self, action: #selector(setWeightChanged(_:)), for: .editingChanged)
        cell.repInput.addTarget(self, action: #selector(setRepChanged(_:)), for: .editingChanged)
        cell.weightInput.delegate = self
        cell.repInput.delegate = self
        cell.weightInput.text = String(placeholderSchedule.sets[indexPath.row].weight)
        cell.repInput.text = String(placeholderSchedule.sets[indexPath.row].repCount)
        return cell
    }
    
    @objc func setWeightChanged(_ textField: UITextField){
        guard let typedText = textField.text else {
            return
        }
        delegate?.didSetWeightChanged(at: textField.tag, newValue: typedText)
    }
    
    @objc func setRepChanged(_ textField: UITextField){
        guard let typedText = textField.text else {
            return
        }
        delegate?.didSetRepChanged(at: textField.tag, newValue: typedText)
    }
}

// MARK: TableViewCells TextField Delegate
extension ExerciseDetailsDataSource {
    // User typed max weight for selected exercise
    @objc func maximumWeightDidChange(_ textField: UITextField) {
        guard let typedText = textField.text else {
            return
        }
        
        guard let maximumWeightInput = Double(typedText) else {
            return
        }
        delegate?.didMaximumWeightEntered(maxWeight: maximumWeightInput)
    }
    
    // Unitmass conversion
    @objc func onConvertToKilogramSelected(){
        delegate?.didConvertToKilogramSelected()
    }
    
    // Unitmass conversion
    @objc func onConvertToLbsSelected(){
        delegate?.didConvertToLbsSelected()
    }
    
    // Adjust reps TableViewCell AddSet button tapped
    @objc func onAddSetButtonTapped(){
        delegate?.didAddSetButtonTapped()
    }
}

// MARK: TextField Validator
extension ExerciseDetailsDataSource: UITextFieldDelegate {
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        let dotsCount = textField.text!.components(separatedBy: ",").count - 1
        if dotsCount > 0 && string == "," {
            return false
        }
        return true
    }
}

