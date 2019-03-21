//
//  Exercise.swift
//  LeanTrack
//
//  Created by KUTAN ÇINGISIZ on 21.03.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import Foundation

struct Exercise {
    var exerciseName: String!
    var sets: [ExerciseSet]?
    
    init(exerciseName: String) {
        self.exerciseName = exerciseName        
    }
}

struct ExerciseSet {
    var repCount = 0
    var weight = 0.0
}
