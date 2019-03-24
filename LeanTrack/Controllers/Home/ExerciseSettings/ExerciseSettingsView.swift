//
//  ExerciseSettingsView.swift
//  LeanTrack
//
//  Created by KUTAN ÇINGISIZ on 17.03.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

class ExerciseSettingsView: UIView {
    
    let cancelButton = ExerciseSettingsViewActionButton()
    let doneButton = ExerciseSettingsViewActionButton()
    let repsCountLabel = ExerciseSettingsViewTextField()
    let weightLabel = ExerciseSettingsViewTextField()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        [cancelButton,doneButton,repsCountLabel,weightLabel].forEach {
            addSubview($0)
        }
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init (coder) has not been implemented")
    }
    
    func setupViews(){
        cancelButton.anchor(top: nil, leading: leadingAnchor, bottom: nil, traling: nil, padding: .init(top: 0, left: 26, bottom: 0, right: 0), size: .init(width: (UIScreen.main.bounds.size.width - 52) / 2, height: 47))
        cancelButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        doneButton.anchor(top: cancelButton.topAnchor, leading: cancelButton.trailingAnchor, bottom: cancelButton.bottomAnchor, traling: trailingAnchor,padding: .init(top: 0, left: 0, bottom: 0, right: 26), size: .init(width: 0, height: 47))
        
        doneButton.backgroundColor = UIColor.emerald
        doneButton.setTitle("DONE", for: .normal)
        
        repsCountLabel.anchor(top: nil, leading: cancelButton.leadingAnchor, bottom: cancelButton.topAnchor, traling: doneButton.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 30, right: 0), size: .init(width: 0, height: 40))
        repsCountLabel.setPlaceHolderTitle("REPS")
        repsCountLabel.keyboardType = .numberPad
        weightLabel.anchor(top: nil, leading: repsCountLabel.leadingAnchor, bottom: repsCountLabel.topAnchor, traling: repsCountLabel.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 30, right: 0), size: .init(width: 0, height: 40))
        weightLabel.setPlaceHolderTitle("WEIGHT")
    }
}

// Rectangular Button with bold title
class ExerciseSettingsViewActionButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.paleRed
        setTitle("CANCEL", for: .normal)
        setTitleColor(.white, for: .normal)
        titleLabel?.setCustomFont(size: 24, fontType: CustomFonts.conduitBold)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init (coder) has not been implemented")
    }
}

// Simple TextField with divider
class ExerciseSettingsViewTextField: UITextField {
    let divider: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        keyboardType = .decimalPad
        font = UIFont(name: "ConduitITC-Bold", size: 36)
        textColor = .white
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init (coder) has not been implemented")
    }
    
    func setupViews(){
        addSubview(divider)
        divider.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, traling: trailingAnchor, padding: .init(top: 4, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 1))
    }
}

extension ExerciseSettingsViewTextField {
    func setPlaceHolderTitle(_ title: String){
        attributedPlaceholder = NSAttributedString(string:title, attributes:[NSAttributedString.Key.foregroundColor: UIColor.white,NSAttributedString.Key.font : UIFont(name: "ConduitITC-Bold", size: 36)!])
    }
}

