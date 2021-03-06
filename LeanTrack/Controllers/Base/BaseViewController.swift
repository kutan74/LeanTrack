//
//  BaseViewController.swift
//  LeanTrack
//
//  Created by KUTAN ÇINGISIZ on 16.03.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

class BaseViewController : UIViewController {
    lazy var errorDisplayer = LeanTrackErrorDisplayer()
    lazy var addExerciseButton = NavigationBarActionButton()
    weak var delegate: BaseViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBaseProperties()
        hideKeyboardWhenTappedAround()
    }
    
    func setBaseProperties(){
        view.backgroundColor = UIColor.white
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    func setupViews(_ subView : UIView){        
        view.addSubview(subView)
        subView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, traling: view.trailingAnchor)
    }
    
    func setupAddExerciseButton(){
        addExerciseButton.addTarget(self, action: #selector(onAddExerciseButtonTapped), for: .touchUpInside)
        guard let navigationBar = self.navigationController?.navigationBar else { return }
        navigationBar.addSubview(addExerciseButton)
        addExerciseButton.anchor(top: nil, leading: nil, bottom: navigationBar.bottomAnchor, traling: navigationBar.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 16, right: 22), size: .init(width: 65, height: 25))
    }
    
    func showAddExerciseButton(_ status: Bool){
        UIView.animate(withDuration: 0.4, animations: {
            self.addExerciseButton.alpha = status ? 1.0 : 0.0
        })
    }
}

extension BaseViewController {
    @objc func onAddExerciseButtonTapped(){
        delegate?.onAddExerciseButtonTapped?()
    }
}

// MARK: Error Displayer
extension BaseViewController {
    func displayLocalizedError(_ errorDescription: String){
        
    }
}
