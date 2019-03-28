//
//  InputView.swift
//  LeanTrack
//
//  Created by KUTAN ÇINGISIZ on 27.03.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

class InputView: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)      
        setProperties()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init (coder) has not been implemented")
    }
    
    func setProperties(){
        layer.cornerRadius = 3
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1.0
        clipsToBounds = true
        attributedPlaceholder = NSAttributedString(string:"0.00", attributes:[NSAttributedString.Key.foregroundColor: UIColor.black.withAlphaComponent(0.23),NSAttributedString.Key.font : UIFont(name: "ConduitITC-Bold", size: 12)!])
        font = UIFont(name: "ConduitITC-Bold", size: 12)!
        textAlignment = .center
    }
}
