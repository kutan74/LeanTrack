//
//  ExerciseDetailsTitleTableViewCell.swift
//  LeanTrack
//
//  Created by KUTAN ÇINGISIZ on 27.03.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

/* TableViewCell containts two UILabels
 There is no usage for subTitleLabel right now. I'm planning to add description to each title in the future
 I might want to refactor it's dynamic constriant implementation. It sucks now
*/
class ExerciseDetailsTitleTableViewCell: UITableViewCell {
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.setCustomFont(size: 16, fontType: CustomFonts.conduitLight)
        return label
    }()
    
    let subTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.brownGrey
        label.setCustomFont(size: 12, fontType: CustomFonts.conduitLight)
        return label
    }()
    
    let primaryButton = NavigationBarActionButton()
    
    var titleBottomConstraint: NSLayoutConstraint!
    var titleTrailingConstraint: NSLayoutConstraint!
    
    var subTitleBottomConstraint: NSLayoutConstraint!
    var subTitleTrailingConstraint: NSLayoutConstraint!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        [titleLabel,subTitleLabel,primaryButton].forEach {
            addSubview($0)
        }
        
        titleLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, traling: nil, padding: .init(top: 10, left: 0, bottom: 0, right: 0))
        titleBottomConstraint = titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        titleBottomConstraint.isActive = true
        titleTrailingConstraint = titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        titleTrailingConstraint.isActive = true
        
        subTitleLabel.anchor(top: titleLabel.bottomAnchor, leading: titleLabel.leadingAnchor, bottom: nil, traling: nil)
        subTitleBottomConstraint = subTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        subTitleBottomConstraint.isActive = false
        subTitleTrailingConstraint = subTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        subTitleTrailingConstraint.isActive = false
        
        primaryButton.anchor(top: nil, leading: nil, bottom: nil, traling: trailingAnchor,padding: .zero, size: .init(width: 65, height: 25))
        primaryButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor).isActive = true
        primaryButton.isHidden = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func enablePrimaryButton(title: String){
        primaryButton.isHidden = false
        primaryButton.setTitle(title, for: .normal)
    }
    
}
