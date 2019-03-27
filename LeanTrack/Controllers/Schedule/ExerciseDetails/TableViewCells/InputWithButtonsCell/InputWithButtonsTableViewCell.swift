//
//  InputWithButtonsTableViewCell.swift
//  LeanTrack
//
//  Created by KUTAN ÇINGISIZ on 27.03.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

class InputWithButtonsTableViewCell: UITableViewCell {
    let cellInputView = InputView()
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
        [cellInputView, primaryButton, secondaryButton].forEach {
            addSubview($0)
        }
        cellInputView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, traling: nil, padding: .init(top: 0, left: 0, bottom: 10, right: 0), size: .init(width: 70, height: 26))
        primaryButton.anchor(top: cellInputView.topAnchor, leading: cellInputView.trailingAnchor, bottom: cellInputView.bottomAnchor, traling: nil, padding: .init(top: 0, left: 28, bottom: 0, right: 0), size: .init(width: 80, height: 25))
        secondaryButton.anchor(top: primaryButton.topAnchor, leading: primaryButton.trailingAnchor, bottom: primaryButton.bottomAnchor, traling: nil, padding: .init(top: 0, left: 11, bottom: 0, right: 0), size: .init(width: 80, height: 25))        
    }
}
