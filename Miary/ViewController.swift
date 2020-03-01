//
//  ViewController.swift
//  Miary
//
//  Created by Euijoon Jung on 2020/02/29.
//  Copyright © 2020 Euijoon Jung. All rights reserved.
//

import UIKit
import AuthenticationServices

class ViewController: UIViewController {

    @IBOutlet weak var loginView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        createLoginBtn()
    }
    
    private func createLoginBtn() {
        let signInWithAppleBtn = ASAuthorizationAppleIDButton(authorizationButtonType: .signIn, authorizationButtonStyle: .black)
        loginView.addSubview(signInWithAppleBtn)
        
        
        signInWithAppleBtn.translatesAutoresizingMaskIntoConstraints = false
        signInWithAppleBtn.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 0.0).isActive = true
        signInWithAppleBtn.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: 0.0).isActive = true

        signInWithAppleBtn.topAnchor.constraint(equalTo: loginView.topAnchor, constant: 0.0).isActive = true
        signInWithAppleBtn.bottomAnchor.constraint(equalTo: loginView.bottomAnchor, constant: 0.0).isActive = true
        
        
//        signInWithAppleBtn.widthAnchor.constraint(equalToConstant: 300.0).isActive = true
        signInWithAppleBtn.addTarget(self, action: #selector(handleAppleLogin), for: .touchUpInside)
        
        
    }
    
    @objc func handleAppleLogin() {
        let request = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = self
        controller.presentationContextProvider = self as? ASAuthorizationControllerPresentationContextProviding
        controller.performRequests()
        
        
    }
}

extension ViewController: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        
        if let credential = authorization.credential as? ASAuthorizationAppleIDCredential {
            print("authorizationCode: \(credential.authorizationCode)")
            let user = credential.user
            print("user name is :\(user)")
            
            if let email = credential.email {
                print("email is :\(email)")
            }
            
            if let fullName = credential.fullName {
                print("fullName is :\(fullName)")
            }
        }
    }
}



