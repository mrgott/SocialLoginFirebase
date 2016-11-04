//
//  ViewController.swift
//  SocialLoginFirebase
//
//  Created by Mikheil Gotiashvili on 10/24/16.
//  Copyright © 2016 mrGott. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //let fbLoginButton = FBSDKLoginButton()
        //fbLoginButton.delegate = self
        let fbLoginButton: UIButton = {
            let fbLoginButton = UIButton(type: .system)
            fbLoginButton.backgroundColor = .blue
            fbLoginButton.translatesAutoresizingMaskIntoConstraints = false
            fbLoginButton.setTitle("Login with Facebook", for: .normal)
            fbLoginButton.setTitleColor(.white, for: .normal)
            fbLoginButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
            fbLoginButton.addTarget(self, action: #selector(handleCustomFBLogin), for: .touchUpInside)
            
            return fbLoginButton
        }()
        
        
        view.addSubview(fbLoginButton)
        fbLoginButton.widthAnchor.constraint(equalToConstant: view.frame.width - 32).isActive = true
        fbLoginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        fbLoginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        fbLoginButton.topAnchor.constraint(equalTo: view.topAnchor, constant:50).isActive = true
        
    }
    
    func handleCustomFBLogin() {
        
        FBSDKLoginManager().logIn(withReadPermissions: ["email", "public_profile"], from: self) { (loginResul, error) in
            
            if error != nil {
                print(error ?? "")
                return
            }
            
            self.fbHandleGetUserData()
            
        }
        
    }
    
    func fbHandleGetUserData() {
        
        FBSDKGraphRequest(graphPath: "/me", parameters: ["fields": "id, name, email"]).start { (connection, result, error) in
            
            if error != nil {
                print(error?.localizedDescription ?? "")
                return
            }
            
            guard let fbResult = result else { return }
            print(fbResult)
            
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

