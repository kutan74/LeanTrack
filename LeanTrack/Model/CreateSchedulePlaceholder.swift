//
//  CreateSchedulePlaceholder.swift
//  LeanTrack
//
//  Created by KUTAN ÇINGISIZ on 27.03.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import Foundation

enum WeightMetricUnit {
    case kilogram
    case lbs
}

/* Placeholder class to hold temporary create schedule values
*/
class CreateSchedulePlaceholder {
    var exerciseMaxWeight = 0.0
    var metricUnit = WeightMetricUnit.kilogram
    var setCount = 0
    var isRPT = false
    var isStrongman = false
    var sets: [WorkoutExerciseSet] = []
}

// MARK: Conversion between metric units
extension CreateSchedulePlaceholder {
    func updateMetricUnit(to unit: WeightMetricUnit){
        switch unit {
        case .kilogram:
            metricUnit = .kilogram
            exerciseMaxWeight = exerciseMaxWeight * 2.20462262
        case .lbs:
            metricUnit = .lbs
            exerciseMaxWeight = exerciseMaxWeight / 2.20462262
        }
    }
}
