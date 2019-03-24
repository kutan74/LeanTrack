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
    var sessionRefId: String!
    typealias loaderHandlerBlock = (_ handler: Error?) -> Void
}

// MARK: Adding collections
extension FirestoreLoader {
    func getTodaysWorkoutSession(handler: @escaping (Bool) -> Void){
        let docRef = db.collection("Workouts").document(getCurrentDate())
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                handler(true)
            } else {
                handler(false)
            }
        }
    }
    
    func createNewWorkoutSession(exerciseName: String, then handler: @escaping (Error?) -> Void) {
        let docData: [String: Any] = [
            "exercise": "Hello world!",
            "booleanExample": true,
            "numberExample": 3.14159265,
            "arrayExample": [5, true, "hello"],
            "nullExample": NSNull(),
            "objectExample": [
                "a": 5,
                "b": [
                    "nested": "foo"
                ]
            ]
        ]
        
        //db.collection("Workouts").document(getCurrentDate()).setData(docData)        
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
        guard let documentID = ref?.documentID else {
            return
        }
        
        let workoutsRef = db.collection("Workouts")
        let workoutSession = workoutsRef.document(documentID)
        workoutSession.updateData([
            "sets" : getSetsDictionary(for: workout)
        ])  { (error) in
            if let err = error {
                print(err.localizedDescription)
                handler(err)
            }else {
                handler(nil)
            }
        }
    }
}

// MARK: Retrieve existing workout session
extension FirestoreLoader {
    func haveExistingWorkoutSession(){
        
    }
}

// MARK: Helpers
/**
 Since firestore doesn't append dict array properly we should create a [[String : String]] and save it to
 Firebase everytimeu users wants to add a new set
 */
extension FirestoreLoader {
    func getSetsDictionary(for workout: ExerciseHeader) -> [[String : String]] {
        var sets : [[String : String]] = []
        for index in 0...workout.sets.count - 1 {
            let set = ["weight" : String(workout.sets[index].weight), "repCount" : String(workout.sets[index].repCount)]
            sets.append(set)
        }
        return sets
    }
    
    func getCurrentDate() -> String{
        let currentDateTime = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd"
        return formatter.string(from: currentDateTime)
    }
}
