//
//  BaseViewControllerDelegate.swift
//  LeanTrack
//
//  Created by KUTAN ÇINGISIZ on 26.03.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import Foundation

/* Protocol for to communicate with BaseViewController
*/
@objc protocol BaseViewControllerDelegate: class {
    @objc optional func onAddExerciseButtonTapped()
}
