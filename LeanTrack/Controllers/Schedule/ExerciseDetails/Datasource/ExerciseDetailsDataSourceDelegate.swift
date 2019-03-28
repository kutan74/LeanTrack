//
//  ExerciseDetailsDataSourceDelegate.swift
//  LeanTrack
//
//  Created by KUTAN ÇINGISIZ on 27.03.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import Foundation

/* ExerciseDetailsDataSource Actions
*/
protocol ExerciseDetailsDataSourceDelegate: class {
    /**
     UnitMass has changed to Kilogram
     */
    func didConvertToKilogramSelected()
    
    /**
     UnitMass has changed to Pounds
     */
    func didConvertToLbsSelected()
    
    /**
     User selected Reverse Pyramid Traning Method
     Feature implementation. It'll adjusts sets automatically depends on the selected exercise
     */
    func didRPTSelected()
    
    /**
     User selected Strongman Traning Method
     Feature implementation. It'll adjusts sets automatically depends on the selected exercise
     */
    func didStrongmanSelected()
    
    /**
     User entered maximum lifted weight for the selected exercise
     
     - Parameter maxWeight: Value of the input field being typed
     */
    func didMaximumWeightEntered(maxWeight: Double)
    
    /**
     User added a exercise set
     */
    func didAddSetButtonTapped()
    
    /**
     User typed a weight value for exercise set
     
     - Parameter index: Index of the set being added
     - Parameter newValue: String value of the set being added
     */
    func didSetWeightChanged(at index: Int, newValue: String)
    
    /**
     User typed a weight value for exercise set
     
     - Parameter index: Index of the set being added
     - Parameter newValue: String value of the set being added
     */
    func didSetRepChanged(at index: Int, newValue: String)
  
}
