//
//  LeanTrackTests.swift
//  LeanTrackTests
//
//  Created by KUTAN ÇINGISIZ on 15.03.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import XCTest
@testable import LeanTrack

class LeanTrackTests: XCTestCase {

    let exerciseDetails = ExerciseDetailsViewController(selectedExercise: WorkoutExercise(exerciseName: "Back Squat"))
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
