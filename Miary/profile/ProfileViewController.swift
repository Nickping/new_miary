//
//  ProfileViewController.swift
//  Miary
//
//  Created by Euijoon Jung on 2020/03/08.
//  Copyright © 2020 Euijoon Jung. All rights reserved.
//

import UIKit
import AuthenticationServices
class ProfileViewController: UIViewController {

    @IBOutlet weak var navBar: MNavigationBar!
    
    @IBOutlet weak var touchIDLock: UISwitch!
    
    static let viewID = "ProfileViewController"
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        navBar.titleLabel.text = "Profile"
        navBar.delegate = self
        
    }
    @IBAction func didChangeTouchIDSettingState(_ sender: Any) {
        if touchIDLock.isOn {
            
        } else {
            
        }
    }
}

extension ProfileViewController: MNavigationBarDelegate {
    func didTapFirstButton() {
        
    }
    
    func didTapSecondButton() {
        
    }
}
