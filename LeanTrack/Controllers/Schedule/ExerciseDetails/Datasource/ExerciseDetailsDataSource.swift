//
//  ExerciseDetailsDataSource.swift
//  LeanTrack
//
//  Created by KUTAN ÇINGISIZ on 27.03.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

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
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "titleCell", for: indexPath) as! ExerciseDetailsTitleTableViewCell
            cell.titleLabel.text = "Enter your maximum weight for \(exerciseName!)"
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "inputCell", for: indexPath) as! InputWithButtonsTableViewCell
            cell.cellInputView.text = String(placeholderSchedule.exerciseMaxWeight)
            cell.cellInputView.addTarget(self, action: #selector(maximumWeightDidChange(_:)), for: .editingChanged)
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
            cell.titleLabel.text = "How many sets will you perform ?"
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "inputCell", for: indexPath) as! InputWithButtonsTableViewCell
            cell.cellInputView.text = String(placeholderSchedule.setCount)
            cell.primaryButton.isHidden = true
            cell.secondaryButton.isHidden = true
            cell.secondaryButton.setTitle("STRONGMAN", for: .normal)
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "titleCell", for: indexPath) as! ExerciseDetailsTitleTableViewCell
            cell.titleLabel.text = "Adjust your reps"
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10.0
    }
}

// MARK: TableViewCells TextField Delegate
extension ExerciseDetailsDataSource {
    @objc func maximumWeightDidChange(_ textField: UITextField) {
        guard let typedText = textField.text else {
            return
        }
        
        guard let maximumWeightInput = Double(typedText) else {
            return
        }
        delegate?.onMaximumWeightEntered(maxWeight: maximumWeightInput)
    }
    
    @objc func onConvertToKilogramSelected(){
        delegate?.onConvertToKilogramSelected()
    }
    
    @objc func onConvertToLbsSelected(){
        delegate?.onConvertToLbsSelected()
    }
}

