//
//  HomeView.swift
//  LeanTrack
//
//  Created by KUTAN ÇINGISIZ on 16.03.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

class HomeView : UIView {
    
    let segmentMenu = HomeSegmentView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        [segmentMenu].forEach {
            addSubview($0)
        }
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init (coder) has not been implemented")
    }
    
    func setupViews(){
        
        segmentMenu.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, traling: trailingAnchor)
        
    }
    
}
