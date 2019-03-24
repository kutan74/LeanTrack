//
//  HomeExerciseProtocols.swift
//  LeanTrack
//
//  Created by KUTAN ÇINGISIZ on 22.03.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import Foundation

/**
 Protocol to provide a communication between HomeDatasource and HomeViewController
 */
protocol HomeDatasourceProtocol: class {
    func onAddSetButtonTappedForExercise(at index: Int)
    func onRemoveButtonTapped(at index: Int)
}

