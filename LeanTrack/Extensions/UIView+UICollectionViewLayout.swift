//
//  UIView+UICollectionViewLayout.swift
//  LeanTrack
//
//  Created by KUTAN ÇINGISIZ on 21.03.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

extension UIView {
    func createUICollectionViewLayout(lineSpacing: CGFloat,itemSize: CGSize = .zero
        , estimatedItemSize: CGSize = .zero) -> UICollectionViewLayout{
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = itemSize
        layout.estimatedItemSize = estimatedItemSize
        layout.minimumLineSpacing = lineSpacing
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .vertical
        layout.sectionInset = .zero
        return layout
    }
}
