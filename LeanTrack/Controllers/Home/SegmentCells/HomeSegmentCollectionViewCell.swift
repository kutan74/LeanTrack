//
//  HomeSegmentCollectionViewCell.swift
//  LeanTrack
//
//  Created by KUTAN ÇINGISIZ on 16.03.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

class HomeSegmentCollectionViewCell : UICollectionViewCell {
    
    let segmentTitle: UILabel = {
       
        let label = UILabel()
        label.textColor = .white
        label.setCustomFont(size: 18, fontType: CustomFonts.conduitBold)
        return label
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)        
        addSubview(segmentTitle)
        segmentTitle.translatesAutoresizingMaskIntoConstraints = false
        segmentTitle.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        segmentTitle.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init (coder) has not been implemented")
    }
    
}
