//
//  WorkoutExerciseSet.swift
//  LeanTrack
//
//  Created by KUTAN ÇINGISIZ on 26.03.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import Foundation

struct WorkoutExerciseSet {
    var weight: Double!
    var repCount: Int!
    
    init(weight: Double, repCount: Int) {
        self.weight = weight
        self.repCount = repCount
    }
}
