//
//  CreateScheduleDataSource.swift
//  LeanTrack
//
//  Created by KUTAN ÇINGISIZ on 26.03.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

class CreateScheduleDataSource: NSObject {
    var days: [String]!
    
    init(days: [String]) {
        self.days = days
    }
}

extension CreateScheduleDataSource: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return days.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ScheduleDayCollectionViewCell
        cell.dayLabel.text = days[indexPath.row]
        return cell
    }
}
