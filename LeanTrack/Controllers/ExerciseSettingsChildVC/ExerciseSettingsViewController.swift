//
//  ExerciseSettingsViewController.swift
//  LeanTrack
//
//  Created by KUTAN ÇINGISIZ on 17.03.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

class ExerciseSettingsViewController : UIViewController {
    let subView = ExerciseSettingsView()
    weak var delegate: ExerciseSettingsProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = UIView()
        view.backgroundColor = UIColor.background.withAlphaComponent(0.8)
        setupViews()
    }
    
    func setupViews(){
        view.addSubview(subView)
        subView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, traling: view.trailingAnchor)
        subView.cancelButton.addTarget(self, action: #selector(onCancelButtonTapped), for: .touchUpInside)
        subView.doneButton.addTarget(self, action: #selector(onDoneButtonTapped), for: .touchUpInside)
    }
    
}

// MARK: Button actions
extension ExerciseSettingsViewController {
    @objc func onCancelButtonTapped(){
        delegate?.onCancelButtonTapped()
    }
    
    @objc func onDoneButtonTapped(){
        do {
            try validateInputFields()
        }catch {
            print(error.localizedDescription)
        }
    }
    
    func validateInputFields() throws {
        guard let weight = subView.weightLabel.text else {
            return
        }
        
        guard let rep = subView.repsCountLabel.text else {
            return
        }
        
        delegate?.onDoneButtonTapped(weight: Double(weight)!, repCount: Int(rep)!)
    }
}

