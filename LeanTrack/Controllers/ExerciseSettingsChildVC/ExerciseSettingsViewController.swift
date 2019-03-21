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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = UIView()
        view.backgroundColor = UIColor.background.withAlphaComponent(0.8)
        setupViews()
    }
    
    func setupViews(){
        view.addSubview(subView)
        subView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, traling: view.trailingAnchor)
    }
    
}

