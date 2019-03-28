//
//  MultipleInputCollectionViewCell.swift
//  LeanTrack
//
//  Created by KUTAN ÇINGISIZ on 28.03.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

class MultipleInputCollectionViewCell: UICollectionViewCell {
    let weightInput = InputView()
    let repInput = InputView()
    
    let multiplierLabel: UILabel = {
        let label = UILabel()
        label.text = "x"
        label.textColor = .black
        label.setCustomFont(size: 16, fontType: CustomFonts.conduitLight)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        [weightInput,multiplierLabel,repInput].forEach {
            addSubview($0)
        }
        
        layoutViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init (coder) has not been implemented")
    }
    
    func layoutViews(){
        weightInput.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, traling: nil,padding: .zero, size: .init(width: 71, height: 26))
        multiplierLabel.anchor(top: nil, leading: weightInput.trailingAnchor, bottom: nil, traling: nil, padding: .init(top: 0, left: 8, bottom: 0, right: 0))
        multiplierLabel.centerYAnchor.constraint(equalTo: weightInput.centerYAnchor).isActive = true
        repInput.anchor(top: weightInput.topAnchor, leading: multiplierLabel.trailingAnchor, bottom: weightInput.bottomAnchor, traling: nil, padding: .init(top: 0, left: 8, bottom: 0, right: 0), size: .init(width: 58, height: 26))
    }
}
