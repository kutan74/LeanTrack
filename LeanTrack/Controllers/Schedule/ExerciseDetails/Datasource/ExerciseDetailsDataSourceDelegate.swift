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
    func onConvertToKilogramSelected()
    func onConvertToLbsSelected()
    func onRPTSelected()
    func onStrongmanSelected()
    func onMaximumWeightEntered(maxWeight: Double)
    func onSetCountEntered(setCount: Int)
}
