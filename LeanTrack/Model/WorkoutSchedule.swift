//
//  WorkoutSchedule.swift
//  LeanTrack
//
//  Created by KUTAN ÇINGISIZ on 26.03.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import Foundation

struct WorkoutSchedule {
    var days: [Int: [WorkoutExercise]] = [:]
    
    init() {
        createNewSchedule()
    }
}

// MARK: Create Empty Schedule or Init From Existing One
extension WorkoutSchedule {
    mutating func createNewSchedule(){
        for i in 0...6 {
            days[i] = []
        }
    }
}

// MARK: Add/Remove Exercises
extension WorkoutSchedule {
    mutating func addNewExercise(to dayAt: Int, with exerciseName: String){
        days[dayAt]?.append(WorkoutExercise(exerciseName: exerciseName))
    }
}
