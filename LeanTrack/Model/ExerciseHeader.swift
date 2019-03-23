//
//  Exercise.swift
//  LeanTrack
//
//  Created by KUTAN ÇINGISIZ on 21.03.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import Foundation

/* We have two different types of collectionviewcells
 Exercise: Movements like (Squat, Deadlift, Bench Press)
 Set: 140kg x 8 reps
 */
enum CellType {
    case exercise
    case set
}

class WorkoutSession {
    var workouts = [Workout<Any>]()
}

struct Workout<T> {
    var cellType: CellType!
    var item : T!
    
    mutating func load(_ item: T, cellType: CellType){
        self.item = item
        self.cellType = cellType
    }
}

struct ExerciseHeader {
    var exerciseName: String!
    var sets: [ExerciseSet]?
    
    init(exerciseName: String) {
        self.exerciseName = exerciseName        
    }
}

struct ExerciseSet {
    var repCount = 0
    var weight = 0.0
    
    init(weight: Double, repCount: Int) {
        self.weight = weight
        self.repCount = repCount
    }
}
