//
//  FeedViewController.swift
//  Miary
//
//  Created by Euijoon Jung on 2020/03/08.
//  Copyright © 2020 Euijoon Jung. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    static let viewID = "FeedViewController"
    
    @IBOutlet weak var feedSortView: FeedSortView!
    @IBOutlet weak var navBar: MNavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    private func setupUI() {
        setupNavBar()
        setupFeedSortview()
    }

    private func setupNavBar() {
        navBar.titleLabel.text = "Feed"
        navBar.delegate = self
        
        navBar.secondButton.isHidden = false
        navBar.secondButton.setImage(UIImage(systemName: "plus.app"), for: .normal)
        navBar.secondButton.setImage(UIImage(systemName: "plus.app.fill"), for: .selected)
    }
    
    private func setupFeedSortview() {
        feedSortView.layer.cornerRadius = feedSortView.frame.height / 4
        feedSortView.wrapperView.layer.cornerRadius = feedSortView.frame.height / 4
    }
}

extension FeedViewController: MNavigationBarDelegate {
    func didTapFirstButton() {
        
    }
    
    func didTapSecondButton() {
        
    }
}

extension FeedViewController: UITableViewDelegate {
    
}

extension FeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
