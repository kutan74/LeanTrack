//
//  InputView.swift
//  LeanTrack
//
//  Created by KUTAN ÇINGISIZ on 27.03.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

class InputView: UITextField {
    private var shadowLayer: CAShapeLayer!
    
    override init(frame: CGRect) {
        super.init(frame: frame)      
        setProperties()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init (coder) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        dropShadow(color: .black, opacity: 0.35, offSet: .init(width: 0, height: 2), radius: 1, scale: true)
    }
    
    func setProperties(){
        backgroundColor = .white
        layer.cornerRadius = 3
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1.0
        clipsToBounds = true
        attributedPlaceholder = NSAttributedString(string:"0.00", attributes:[NSAttributedString.Key.foregroundColor: UIColor.black.withAlphaComponent(0.23),NSAttributedString.Key.font : UIFont(name: "ConduitITC-Bold", size: 12)!])
        font = UIFont(name: "ConduitITC-Bold", size: 12)!
        textAlignment = .center
        keyboardType = .decimalPad
    }
}

extension InputView {
    func applyPlaceHolderWithString(_ placeholder: String){
        attributedPlaceholder = NSAttributedString(string:placeholder, attributes:[NSAttributedString.Key.foregroundColor: UIColor.black.withAlphaComponent(0.23),NSAttributedString.Key.font : UIFont(name: "ConduitITC-Bold", size: 12)!])
    }
}

