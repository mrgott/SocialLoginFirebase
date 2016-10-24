//
//  ViewController.swift
//  SocialLoginFirebase
//
//  Created by Mikheil Gotiashvili on 10/24/16.
//  Copyright © 2016 mrGott. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class ViewController: UIViewController, FBSDKLoginButtonDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let fbLoginButton = FBSDKLoginButton()
        fbLoginButton.delegate = self
        fbLoginButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(fbLoginButton)
        fbLoginButton.widthAnchor.constraint(equalToConstant: view.frame.width - 32).isActive = true
        fbLoginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        fbLoginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        fbLoginButton.topAnchor.constraint(equalTo: view.topAnchor, constant:50).isActive = true
        
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        
        print("Did Log Out")
        
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        
        if error != nil {
            print(error.localizedDescription)
            return
        }
        
        print("Successfully Logged In!")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

