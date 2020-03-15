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
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var feedSortView: FeedSortView!
    @IBOutlet weak var navBar: MNavigationBar!
    var viewModel: FeedViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        viewModel = FeedViewModel()
        viewModel?.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    private func setupUI() {
        setupNavBar()
        setupFeedSortview()
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: FeedView.viewID, bundle: nil), forCellWithReuseIdentifier: FeedView.viewID)
        
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
        let feedCreationVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: FeedCreationViewController.viewID) as! FeedCreationViewController
        
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationController?.pushViewController(feedCreationVC, animated: false)
    }
}

extension FeedViewController: UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let transition = scrollView.panGestureRecognizer.translation(in: scrollView.superview)
        if transition.y > 0 {
            feedSortView.isHidden = false
        } else {
            feedSortView.isHidden = true
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let feedDetailVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: FeedDetailViewController.viewID) as! FeedDetailViewController
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationController?.pushViewController(feedDetailVC, animated: true)
    }
}

extension FeedViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.feeds?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let feedCell = collectionView.dequeueReusableCell(withReuseIdentifier: FeedView.viewID, for: indexPath) as? FeedView,
        let feedItem = viewModel?.feeds?[indexPath.row] else {
            return UICollectionViewCell()
        }
        
        feedCell.bindData(feedItem)
        return feedCell
    }
}

extension FeedViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.bounds.size.width - 20, height: 300)
    }
}


extension FeedViewController: FeedViewModelDelegate {
    func didCompleteLoad() {
        collectionView.reloadData()
    }
}
