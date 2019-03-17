//
//  SearchResultProtocol.swift
//  LeanTrack
//
//  Created by KUTAN ÇINGISIZ on 17.03.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import Foundation

/**
 * Protocol to whenever user selects an item from SearchExerciseViewController
 */
protocol SearchResultProtocol: class {
    
    func onExerciseSelected(_ exercise : String)
    
}
