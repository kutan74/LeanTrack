//
//  CreateSchedulePlaceholder.swift
//  LeanTrack
//
//  Created by KUTAN ÇINGISIZ on 27.03.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import Foundation

/* Placeholder class to hold temporary create schedule values
*/
class CreateSchedulePlaceholder {
    var exerciseMaxWeight = 0.0
    var metricUnit = UnitMass.kilograms
    var setCount = 0
    var isRPT = false
    var isStrongman = false
    var sets: [WorkoutExerciseSet] = []
}

// MARK: Conversion between metric units
extension CreateSchedulePlaceholder {
    func updateMetricUnit(to unit: UnitMass){
        guard unit != metricUnit else {
            return
        }
        
        var measurement = Measurement(value: exerciseMaxWeight, unit: metricUnit)
        
        switch unit {
        case UnitMass.kilograms:
            metricUnit = .kilograms
        case UnitMass.pounds:
            metricUnit = .pounds
        default:
            break
        }
        
        measurement.convert(to: metricUnit)
        exerciseMaxWeight = measurement.value.rounded(digits: 1)
    }
}

extension Double {
    func rounded(digits: Int) -> Double {
        let multiplier = pow(10.0, Double(digits))
        return (self * multiplier).rounded() / multiplier
    }
}
