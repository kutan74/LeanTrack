//
//  WorkoutDay.swift
//  LeanTrack
//
//  Created by KUTAN ÇINGISIZ on 26.03.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import Foundation

struct WorkoutExercise {
    var exerciseName: String!
    var sets: [WorkoutExerciseSet]!
    
    var isReversePyramidTraning: Bool?
    var isStrongman: Bool?
    var willIncreaseLinearly: Bool?
    
    init(exerciseName: String) {
        self.exerciseName = exerciseName
        self.sets = []
    }
}

// MARK: WorkoutDay Set Adjustments
extension WorkoutExercise {
    mutating func addSet(weight: Double, repCount: Int){
        self.sets.append(WorkoutExerciseSet(weight: weight, repCount: repCount))
    }
    
    mutating func removeSet(at index: Int){
        self.sets.remove(at: index)
    }
}

// MARK: WorkoutDay special features
/* I'm actually planning to make these features premium.
 - Reverse Pyramid Training is a style of training where the trainee puts their heaviest set first, then 'pyramids down' to a lighter weight, usually with more reps for the latter sets.
 - Strongman is basically 5x5 traning method.
 - Linear increase is means increase weight % 2.5 each week (might be % 5 too).
 */
extension WorkoutExercise {
    mutating func setReversePyramidTraningStatus(_ status:Bool){
        self.isReversePyramidTraning = status
    }
    
    mutating func setStrongman(_ status: Bool){
        self.isStrongman = status
    }
    
    mutating func setIncreaseLinearly(_ status: Bool){
        self.willIncreaseLinearly = status
    }
}
