//
//  PlayListSummaryTableViewCell.swift
//  Miary
//
//  Created by Euijoon Jung on 2020/03/15.
//  Copyright © 2020 Euijoon Jung. All rights reserved.
//

import UIKit

class PlayListSummaryTableViewCell: UITableViewCell {

    @IBOutlet weak var albumImage: UIImageView!
    @IBOutlet weak var musicTitle: UILabel!
    @IBOutlet weak var artistTitle: UILabel!
    
    @IBOutlet weak var editBtn: UIButton!
    static let viewID = "PlayListSummaryTableViewCell"
    static let cellHeight: CGFloat = 55
    
    private var item: PlayListItem?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)        
    }
    
    
    func bindData(_ playListItem: PlayListItem) {
        self.item = playListItem
        musicTitle?.text = item?.title
        artistTitle?.text = item?.artist
        
    }
    @IBAction func didTapEditBtn(_ sender: Any) {
    }
    
}
