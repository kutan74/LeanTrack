//
//  LeanTrackErrors.swift
//  LeanTrack
//
//  Created by KUTAN ÇINGISIZ on 22.03.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import Foundation

enum LeanTrackErrors: Error {
    case firebaseError
    case zeroWeightEntered
}

extension LeanTrackErrors {
    var errorDescription: String {
        switch self {
        case .firebaseError:
            return NSLocalizedString("Something happened during syncing your workout session. Make sure you have an active internet connection", comment: "")
        case .zeroWeightEntered:
            return NSLocalizedString("", comment: "")
        }
    }
}
