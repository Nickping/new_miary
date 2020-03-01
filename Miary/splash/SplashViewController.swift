//
//  SplashViewController.swift
//  Miary
//
//  Created by Euijoon Jung on 2020/02/29.
//  Copyright © 2020 Euijoon Jung. All rights reserved.
//

import UIKit
import AuthenticationServices


class SplashViewController: UIViewController {

    @IBOutlet weak var guestLoginView: UIView!
    @IBOutlet weak var appleLoginView: UIView!
    @IBOutlet weak var backgroundLabel: UILabel!
    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var logoImage: UIImageView!
    
    static let movingUpLength: CGFloat = 70.0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        animateToChangeLabels()
        // Do any additional setup after loading the view.
    }
    
    private func setupUI() {
        setupAppleLogin()
    }
    
    private func setupAppleLogin() {
        let signInWithAppleBtn = ASAuthorizationAppleIDButton(authorizationButtonType: .signIn, authorizationButtonStyle: .black)
        appleLoginView.addSubview(signInWithAppleBtn)
        
        
        signInWithAppleBtn.translatesAutoresizingMaskIntoConstraints = false
        signInWithAppleBtn.leadingAnchor.constraint(equalTo: appleLoginView.leadingAnchor, constant: 0.0).isActive = true
        signInWithAppleBtn.trailingAnchor.constraint(equalTo: appleLoginView.trailingAnchor, constant: 0.0).isActive = true
        
        signInWithAppleBtn.topAnchor.constraint(equalTo: appleLoginView.topAnchor, constant: 0.0).isActive = true
        signInWithAppleBtn.bottomAnchor.constraint(equalTo: appleLoginView.bottomAnchor, constant: 0.0).isActive = true
        
        signInWithAppleBtn.addTarget(self, action: #selector(handleAppleLogin), for: .touchUpInside)
    }
    
    @objc func handleAppleLogin() {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }
    
    private func animateToChangeLabels() {
        
        UIView.animate(withDuration: 1.0, animations: {
            self.frontLabel.alpha = 0.0
        }) { (isEnded) in
            
        }
        
        UIView.animate(withDuration: 1.0, delay: 0.3, options: .curveEaseIn, animations: {
            self.backgroundLabel.alpha = 1.0
        }) { (isEnded) in
            if isEnded {
                self.animateLabelsUp()
                self.animateLoginViews()
            }
        }
    }
    
    private func animateLoginViews() {
        UIView.animate(withDuration: 1.0, animations: {
            let oldLoginViewCenter = self.appleLoginView.center
            
            self.appleLoginView.center = CGPoint(x: oldLoginViewCenter.x, y: oldLoginViewCenter.y - SplashViewController.movingUpLength)
            self.appleLoginView.alpha = 1.0
            
            self.guestLoginView.center = CGPoint(x: self.guestLoginView.center.x, y: self.guestLoginView.center.y - SplashViewController.movingUpLength)
            self.guestLoginView.alpha = 1.0
            
        }) { (isEnded) in
            
        }
    }
    
    
    private func animateLabelsUp() {
        UIView.animate(withDuration: 1.0, animations: {
            let oldImageCenter = self.logoImage.center
            let oldLabelCenter = self.backgroundLabel.center
            
            self.logoImage.center = CGPoint(x: oldImageCenter.x, y: oldImageCenter.y - SplashViewController.movingUpLength)
            self.backgroundLabel.center = CGPoint(x: oldLabelCenter.x, y: oldLabelCenter.y - SplashViewController.movingUpLength)
        }) { (isEnded) in
            if isEnded {
                
            }
        }
    }
    @IBAction func didTapGeustLogin(_ sender: Any) {
    }
}


extension SplashViewController: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        authorization.credential
    }
}


extension SplashViewController: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
    
    
}
