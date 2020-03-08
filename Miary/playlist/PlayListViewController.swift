//
//  PlayListViewController.swift
//  Miary
//
//  Created by Euijoon Jung on 2020/03/08.
//  Copyright © 2020 Euijoon Jung. All rights reserved.
//

import UIKit

class PlayListViewController: UIViewController {

    
    @IBOutlet weak var navBar: MNavigationBar!
    static let viewID = "PlayListViewController"
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        navBar.titleLabel.text = "Play List"
        navBar.delegate = self
    }
}

extension PlayListViewController: MNavigationBarDelegate {
    func didTapFirstButton() {
        
    }
    
    func didTapSecondButton() {
        
    }
}
