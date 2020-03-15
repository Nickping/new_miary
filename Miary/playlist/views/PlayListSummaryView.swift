//
//  PlayListSummaryView.swift
//  Miary
//
//  Created by Euijoon Jung on 2020/03/15.
//  Copyright © 2020 Euijoon Jung. All rights reserved.
//

import UIKit

class PlayListSummaryView: UIView {
    
    static let viewID = "PlayListSummaryView"
    
    @IBOutlet weak var creationDate: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var playListImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    var viewHeight: CGFloat = 0.0
    
    var listItems: [PlayListItem] = [] {
        didSet {
            viewHeight = (tableView.rowHeight * CGFloat(listItems.count)) + 110.0
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialize()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    private func initialize() {
        
        let view = Bundle.main.loadNibNamed(PlayListSummaryView.viewID, owner: self, options: nil)![0] as! UIView
        
        view.frame = self.bounds
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: PlayListSummaryTableViewCell.viewID, bundle: nil), forCellReuseIdentifier: PlayListSummaryTableViewCell.viewID)
        
        tableView.tableFooterView = UIView()
        tableView.separatorColor = UIColor.clear
        tableView.rowHeight = PlayListSummaryTableViewCell.cellHeight
        addSubview(view)
        
        
    }
    
    func bindData(_ playListItems: [PlayListItem]) {
        self.listItems = playListItems
        tableView.reloadData()
    }
    
    @IBAction func didTapPlayBtn(_ sender: Any) {
        
    }
}

extension PlayListSummaryView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension PlayListSummaryView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PlayListSummaryTableViewCell.viewID, for: indexPath) as? PlayListSummaryTableViewCell else { return UITableViewCell() }
        
        let item = listItems[indexPath.row]
        cell.bindData(item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return PlayListSummaryTableViewCell.cellHeight
    }
}
