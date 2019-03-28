//
//  MultipleButtonsCell.swift
//  LeanTrack
//
//  Created by KUTAN ÇINGISIZ on 28.03.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

class MultipleButtonsCell: UITableViewCell {
    let primaryButton = CreateScheduleActionButton()
    let secondaryButton = CreateScheduleActionButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupViews(){
        [primaryButton, secondaryButton].forEach {
            addSubview($0)
        }
        primaryButton.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, traling: nil, padding: .init(top: 0, left: 0, bottom: 10, right: 0), size: .init(width: 80, height: 25))
        secondaryButton.anchor(top: primaryButton.topAnchor, leading: primaryButton.trailingAnchor, bottom: primaryButton.bottomAnchor, traling: nil, padding: .init(top: 0, left: 11, bottom: 0, right: 0), size: .init(width: 80, height: 25))
    }
}
