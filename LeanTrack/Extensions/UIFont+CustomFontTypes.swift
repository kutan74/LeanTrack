//
//  UIFont+CustomFontTypes.swift
//  LeanTrack
//
//  Created by KUTAN ÇINGISIZ on 16.03.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

enum CustomFonts {
    case ConduitBold
    case ConduitLight
    case ConduitMedium
}

extension UILabel {
    
    func setFont(size : CGFloat, weight : UIFont.Weight){
        font = UIFont.systemFont(ofSize: size, weight: weight)
    }
    
    
    func setItalicFont(size : CGFloat, weight : UIFont.Weight){
        font = UIFont.italicSystemFont(ofSize: size)
    }
    
    func setCustomFont(size : CGFloat, fontType : CustomFonts){
        
        switch fontType {
        case .ConduitBold:
            font = UIFont(name: "ConduitITC-Bold", size: size)
        case .ConduitLight:
            font = UIFont(name: "ConduitITC-Light", size: size)
        case .ConduitMedium:
            font = UIFont(name: "ConduitITC-Medium", size: size)
        }
        
    }
    
}
