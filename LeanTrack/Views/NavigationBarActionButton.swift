//
//  AddExerciseButton.swift
//  LeanTrack
//
//  Created by KUTAN ÇINGISIZ on 26.03.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

/* When we use preferLargeTitles for navigation bar, Navbar height goes to 96px
 I needed a Save button where users can save their schedule changes and I wanted to put it right next to bar title
 Therefore I created a UIButton. I add it to NavigationBar view and set my custom constraints
*/
class NavigationBarActionButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init (coder) has not been implemented")
    }
    
    func setupButton(){
        setTitle("Add Exercise", for: .normal)
        setTitleColor(.black, for: .normal)
        titleLabel?.setCustomFont(size: 12, fontType: CustomFonts.conduitBold)
        layer.cornerRadius = 3
        clipsToBounds = true
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1.0
        backgroundColor = .clear
        frame = CGRect(x: 0, y: 0, width: 70, height: 25)
    }
}
