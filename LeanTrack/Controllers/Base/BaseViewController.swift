//
//  BaseViewController.swift
//  LeanTrack
//
//  Created by KUTAN ÇINGISIZ on 16.03.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

class BaseViewController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBaseProperties()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Set base properties. We have some common properties like background color, status bar color for view controllers
    func setBaseProperties(){
        view.backgroundColor = UIColor.background
    }
    
    // Layout subview
    func setupViews(_ subView : UIView){        
        view.addSubview(subView)
        subView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, traling: view.trailingAnchor)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}
