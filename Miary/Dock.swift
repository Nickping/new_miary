//
//  Dock.swift
//  Miary
//
//  Created by Euijoon Jung on 2020/03/08.
//  Copyright © 2020 Euijoon Jung. All rights reserved.
//

import UIKit


class Dock: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.isHidden = true
        
        let isLogined = true
        
        if isLogined {
            startMainView()
        } else {
            startLoginView()
        }
        
    }
    
    private func startLoginView() {
        let splashVC = UIStoryboard.init(name: "Splash", bundle: nil).instantiateViewController(identifier: SplashViewController.viewID) as! SplashViewController
        splashVC.delegate = self
        self.addChild(splashVC)
    }
    
    private func startSplashView() {
        
    }
    
    private func startMainView() {
        
        self.tabBar.isHidden = false
        let feedItemBarItem = UITabBarItem(title: "feed", image: UIImage(systemName: "book"), tag: 0)
        let playListBarItem = UITabBarItem(title: "playlist", image: UIImage(systemName: "music.note"), tag: 1)
        let profileBarItem = UITabBarItem(title: "profile", image: UIImage(systemName: "person"), tag: 2)
        //        let emtpyBarItem = UITabBarItem(title: "", image: nil, tag: -1)
        
        let feedVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: FeedViewController.viewID)
        let feedVCEmbedded = UINavigationController(rootViewController: feedVC)
        feedVCEmbedded.setNavigationBarHidden(true, animated: false)
        
        let playListVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: PlayListViewController.viewID)
        let playListVCEmbedded = UINavigationController(rootViewController: playListVC)
        playListVCEmbedded.setNavigationBarHidden(true, animated: false)
        
        let profileVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: ProfileViewController.viewID)
        let profileVCEmbedded = UINavigationController(rootViewController: profileVC)
        profileVCEmbedded.setNavigationBarHidden(true, animated: false)
        
        feedVCEmbedded.tabBarItem = feedItemBarItem
        playListVCEmbedded.tabBarItem = playListBarItem
        profileVCEmbedded.tabBarItem = profileBarItem
        
        self.viewControllers = [feedVCEmbedded, playListVCEmbedded, profileVCEmbedded]
        self.tabBarController?.tabBar.setItems([feedItemBarItem, playListBarItem, profileBarItem], animated: false)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
    }
}

extension Dock: SplashViewControllerDelegate {
    func didLoginWithGuest() {
        startMainView()
    }
    
    func didLogwinWithApple() {
        startMainView()
    }
}
