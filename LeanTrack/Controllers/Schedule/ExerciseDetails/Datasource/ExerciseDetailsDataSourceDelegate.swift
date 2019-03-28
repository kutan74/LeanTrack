//
//  ExerciseDetailsDataSourceDelegate.swift
//  LeanTrack
//
//  Created by KUTAN ÇINGISIZ on 27.03.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import Foundation

/* ExerciseDetailsDataSource Actions
*/
protocol ExerciseDetailsDataSourceDelegate: class {
    func didConvertToKilogramSelected()
    func didConvertToLbsSelected()
    func didRPTSelected()
    func didStrongmanSelected()
    func didMaximumWeightEntered(maxWeight: Double)
    func didAddSetButtonTapped()
    func didSetWeightChanged(at index: Int, newValue: String)
    func didSetRepChanged(at index: Int, newValue: String)
}
