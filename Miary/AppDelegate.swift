//
//  AppDelegate.swift
//  Miary
//
//  Created by Euijoon Jung on 2020/02/29.
//  Copyright © 2020 Euijoon Jung. All rights reserved.
//

import UIKit
import AuthenticationServices

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
//        Thread.sleep(until: Date.init(timeIntervalSinceNow: 1.5))
        
//        guard let window = self.window, let splashVC = UIStoryboard.init(name: "Splash", bundle: nil).instantiateViewController(identifier: "SplashViewController") as? SplashViewController else { return true }
//
//        self.window?.addSubview(splashVC.view)
        
        let dock = Dock()
        
        self.window?.rootViewController = dock
//        let appleIDProvider = ASAuthorizationAppleIDProvider()
//        appleIDProvider.getCredentialState(forUserID: KeychainItem.currentUserIdentifier) { (credentialState, error) in
//            switch credentialState {
//            case .authorized:
//                break // The Apple ID credential is valid.
//            case .revoked, .notFound:
//                // The Apple ID credential is either revoked or was not found, so show the sign-in UI.
//                DispatchQueue.main.async {
//                    self.window?.rootViewController?.showLoginViewController()
//                }
//            default:
//                break
//            }
//        }
        return true
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        
        
        
    }
    

}

