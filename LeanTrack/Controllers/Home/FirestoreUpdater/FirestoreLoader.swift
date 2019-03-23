//
//  FirestoreUpdater.swift
//  LeanTrack
//
//  Created by KUTAN ÇINGISIZ on 23.03.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import Foundation
import FirebaseFirestore

class FirestoreLoader {
    
    let db = Firestore.firestore()
    var ref: DocumentReference? = nil
    typealias loaderHandlerBlock = (_ handler: Error?) -> Void
    
}

// MARK: Adding collections
extension FirestoreLoader {
    func createNewWorkoutSession(exerciseName: String, then handler: @escaping (Error?) -> Void) {
        ref = db.collection("Workouts").addDocument(data: [
            "exerciseName": exerciseName,
            "date": self.getCurrentDate()
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
                handler(err)
            } else {
                handler(nil)
                print("Document added with ID: \(self.ref!.documentID)")
            }
        }
    }
    
    func addWorkoutSet(to documentID: String, workout: ExerciseHeader, then handler: @escaping (Error?) -> Void) {
        //let stringDefinationOfSet = String(weight) + "x" + String(repCount)
        let dict = Dictionary(uniqueKeysWithValues: workout.sets.map{ ($0.weight, $0) })
        let workoutsRef = db.collection("Workouts")
        let workoutSession = workoutsRef.document(documentID)
        workoutSession.updateData([
            "sets" : ""
        ])  { (error) in
            if let err = error {
                handler(err)
            }else {
                handler(nil)
            }
        }
        
    }
}

// MARK: Date
extension FirestoreLoader {
    func getCurrentDate() -> String{
        let currentDateTime = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        return formatter.string(from: currentDateTime)
    }
    
}
