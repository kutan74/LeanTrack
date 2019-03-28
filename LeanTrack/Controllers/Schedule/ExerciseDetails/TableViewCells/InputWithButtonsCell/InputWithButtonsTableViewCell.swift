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
        addSubview(cellInputView)
        cellInputView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, traling: nil, padding: .init(top: 0, left: 0, bottom: 10, right: 0), size: .init(width: 70, height: 26))                
    }
}
