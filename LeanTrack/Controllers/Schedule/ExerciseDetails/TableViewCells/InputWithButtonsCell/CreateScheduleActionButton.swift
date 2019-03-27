//
//  ExerciseDetailsButton.swift
//  LeanTrack
//
//  Created by KUTAN ÇINGISIZ on 27.03.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

class CreateScheduleActionButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setButtonProperties()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init (coder) has not been implemented")
    }
    
    func setButtonProperties(){
        clipsToBounds = true
        backgroundColor = .clear
        layer.cornerRadius = 3
        layer.borderColor = UIColor.veryLightPink.cgColor
        layer.borderWidth = 1.0
        setTitleColor(UIColor.brownishGrey, for: .normal)
        titleLabel?.setCustomFont(size: 12, fontType: CustomFonts.conduitBold)
    }
    
    func setSelectionStatus(_ status: Bool){
        if status {
            backgroundColor = UIColor.blackTwo
            setTitleColor(.white, for: .normal)
        }else {
            backgroundColor = UIColor.clear
            setTitleColor(UIColor.brownishGrey, for: .normal)
        }
    }
}
