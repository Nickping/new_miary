//
//  FeedViewModel.swift
//  Miary
//
//  Created by Euijoon Jung on 2020/03/08.
//  Copyright © 2020 Euijoon Jung. All rights reserved.
//

import Foundation
import RealmSwift

protocol FeedViewModelDelegate: class {
    func didCompleteLoad()
}

class FeedViewModel {
    
    var feeds: [FeedItem]? {
        didSet {
            delegate?.didCompleteLoad()
        }
    }
    
    weak var delegate: FeedViewModelDelegate?
    
    init() {
        feeds = []
        
        feeds?.append(FeedItem(subTitle: "2020.03.15", mainTitle: "on a sunnyDay", feedImages: nil, mainContent: "날이 정말 좋아서", date: nil))
        
        feeds?.append(FeedItem(subTitle: "2020.03.15", mainTitle: "on a sunnyDay", feedImages: nil, mainContent: "날이 정말 좋아서", date: nil))
        
        feeds?.append(FeedItem(subTitle: "2020.03.15", mainTitle: "on a sunnyDay", feedImages: nil, mainContent: "날이 정말 좋아서", date: nil))
        
        feeds?.append(FeedItem(subTitle: "2020.03.15", mainTitle: "on a sunnyDay", feedImages: nil, mainContent: "날이 정말 좋아서", date: nil))
        
        feeds?.append(FeedItem(subTitle: "2020.03.15", mainTitle: "on a sunnyDay", feedImages: nil, mainContent: "날이 정말 좋아서", date: nil))
        
        feeds?.append(FeedItem(subTitle: "2020.03.15", mainTitle: "on a sunnyDay", feedImages: nil, mainContent: "날이 정말 좋아서", date: nil))
        
        
    }
}
