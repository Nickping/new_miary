//
//  FeedDetailViewController.swift
//  Miary
//
//  Created by Euijoon Jung on 2020/03/15.
//  Copyright © 2020 Euijoon Jung. All rights reserved.
//

import UIKit

class FeedDetailViewController: UIViewController {
    
    @IBOutlet weak var playListSummaryHeightConst: NSLayoutConstraint!
    @IBOutlet weak var playListSummaryView: PlayListSummaryView!
    static let viewID = "FeedDetailViewController"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isTranslucent = true
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.view.backgroundColor = .clear
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(didTapEditBtn))
        
        playListSummaryView.bindData([
            PlayListItem(image: nil, title: "Stupid Love", artist: "lady gaga", album: nil),
            PlayListItem(image: nil, title: "On", artist: "BTS", album: nil),
            PlayListItem(image: nil, title: "아무노래", artist: "ZICO", album: nil),
            PlayListItem(image: nil, title: "Circles", artist: "Post maloane", album: nil),
            PlayListItem(image: nil, title: "For Now", artist: "Zsela", album: nil),
            PlayListItem(image: nil, title: "For Now", artist: "Zsela", album: nil),
            PlayListItem(image: nil, title: "For Now", artist: "Zsela", album: nil),
            PlayListItem(image: nil, title: "For Now", artist: "Zsela", album: nil)
        ])
        
        playListSummaryHeightConst.constant = playListSummaryView.viewHeight
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @objc func didTapEditBtn() {
        
    }
}
