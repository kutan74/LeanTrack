//
//  UIFont+CustomFontTypes.swift
//  LeanTrack
//
//  Created by KUTAN ÇINGISIZ on 16.03.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

enum CustomFonts {
    case conduitBold
    case conduitLight
    case conduitMedium
}

extension UILabel {
    func setFont(size: CGFloat, weight: UIFont.Weight){
        font = UIFont.systemFont(ofSize: size, weight: weight)
    }
    
    func setItalicFont(size : CGFloat, weight: UIFont.Weight){
        font = UIFont.italicSystemFont(ofSize: size)
    }
    
    func setCustomFont(size: CGFloat, fontType: CustomFonts){
        switch fontType {
        case .conduitBold:
            font = UIFont(name: "ConduitITC-Bold", size: size)
        case .conduitLight:
            font = UIFont(name: "ConduitITC-Light", size: size)
        case .conduitMedium:
            font = UIFont(name: "ConduitITC-Medium", size: size)
        }
    }
}
