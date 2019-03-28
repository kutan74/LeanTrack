//
//  ExerciseDetailsView.swift
//  LeanTrack
//
//  Created by KUTAN ÇINGISIZ on 27.03.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

class ExerciseDetailsView: UIView {
    
    var tableView: UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCollectionViewLayout()
        registerTableViewCells()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init (coder) has not been implemented")
    }
    
    func setupCollectionViewLayout(){
        tableView = UITableView()
        tableView.allowsSelection = false
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 120
        tableView.rowHeight = UITableView.automaticDimension
        tableView.backgroundColor = .clear
        addSubview(tableView)
        tableView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, traling: trailingAnchor, padding: .init(top: 30, left: 22, bottom: 30, right: 22), size: .init(width: 0, height: UIScreen.main.bounds.size.height - 70))
    }
    
    func registerTableViewCells(){
        tableView.register(ExerciseDetailsTitleTableViewCell.self, forCellReuseIdentifier: "titleCell")
        tableView.register(InputWithButtonsTableViewCell.self, forCellReuseIdentifier: "inputCell")
        tableView.register(AdjustRepsTableViewCell.self, forCellReuseIdentifier: "multipleInputsCell")
    }
}
