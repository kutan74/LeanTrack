//
//  BaseViewController.swift
//  LeanTrack
//
//  Created by KUTAN ÇINGISIZ on 16.03.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

class BaseViewController : UIViewController {
    private lazy var errorDisplayer = LeanTrackErrorDisplayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBaseProperties()
        hideKeyboardWhenTappedAround()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func setBaseProperties(){
        view.backgroundColor = UIColor.background
    }
    
    func setupViews(_ subView : UIView){        
        view.addSubview(subView)
        subView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, traling: view.trailingAnchor)
    }
}

// MARK: Error Displayer
extension BaseViewController {
    func displayLocalizedError(_ errorDescription: String){
        
    }
}
