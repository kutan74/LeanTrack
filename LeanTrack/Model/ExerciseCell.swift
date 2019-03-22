//
//  ExerciseCell.swift
//  LeanTrack
//
//  Created by KUTAN ÇINGISIZ on 22.03.2019.
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

struct ExerciseCell<T> {
    var cellType: CellType!
    var item: T
    
    mutating func add(item: T) {
        self.item = item
    }
}
