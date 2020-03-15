//
//  FeedView.swift
//  Miary
//
//  Created by Euijoon Jung on 2020/03/15.
//  Copyright © 2020 Euijoon Jung. All rights reserved.
//

import UIKit

class FeedView: UICollectionViewCell {
    
    static let viewID = "FeedView"
    
    @IBOutlet weak var containerView: UIView!
    private var shadowLayer: CAShapeLayer!
    
    @IBOutlet weak var dimView: UIView!
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var feedImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        containerView.layer.shadowColor = UIColor.gray.cgColor
        containerView.layer.shadowOffset = .init(width: -30, height: -20)
        containerView.layer.shadowOpacity = 0.3
        containerView.layer.shadowRadius = bounds.width / 8
        
        bringSubviewToFront(dimView)
        self.layer.cornerRadius = bounds.width / 8
        
    }
    
    func bindData(_ feedItem: FeedItem) {
        // TOOD: set data
        feedImage.image = UIImage(named: "backGround")
        mainTitle.text = feedItem.mainTitle
        subTitle.text = feedItem.subTitle
    }
    
}
