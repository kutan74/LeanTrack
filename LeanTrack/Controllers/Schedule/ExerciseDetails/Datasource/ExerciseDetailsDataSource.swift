//
//  ExerciseDetailsDataSource.swift
//  LeanTrack
//
//  Created by KUTAN ÇINGISIZ on 27.03.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

class ExerciseDetailsDataSource: NSObject {
    var exerciseName: String!
    weak var delegate: ExerciseDetailsDataSourceDelegate?
    
    init(exerciseName: String) {
        self.exerciseName = exerciseName
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
            cell.cellInputView.text = "0.00"
            cell.cellInputView.addTarget(self, action: #selector(maximumWeightDidChange(_:)), for: .editingChanged)
            cell.primaryButton.addTarget(self, action: #selector(onConvertToKilogramSelected), for: .touchUpOutside)
            cell.secondaryButton.addTarget(self, action: #selector(onConvertToLbsSelected), for: .touchUpOutside)
            cell.primaryButton.setTitle("KG", for: .normal)
            cell.primaryButton.applySelectedProperties()
            cell.secondaryButton.setTitle("LBS", for: .normal)
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "titleCell", for: indexPath) as! ExerciseDetailsTitleTableViewCell
            cell.titleLabel.text = "How many sets will you perform ?"
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "inputCell", for: indexPath) as! InputWithButtonsTableViewCell
            cell.cellInputView.text = "0"
            cell.primaryButton.setTitle("RPT", for: .normal)
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
}

extension ExerciseDetailsDataSource {
    @objc func onConvertToKilogramSelected(){
        delegate?.onConvertToKilogramSelected()
    }
    
    @objc func onConvertToLbsSelected(){
        delegate?.onConvertToLbsSelected()
    }
}
