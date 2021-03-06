//
//  ViewController.swift
//  LFLoginController
//
//  Created by Lucas Farah on 6/10/16.
//  Copyright © 2016 Lucas Farah. All rights reserved.
//
// swiftlint:disable line_length
// swiftlint:disable trailing_whitespace

import UIKit

class ViewController: UIViewController {
    
    let controller = LFLoginController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        controller.delegate = self
        
        // Customizations
        controller.logo = UIImage(named: "AwesomeLabsLogoWhite")
//		controller.videoURL = NSBundle.mainBundle().URLForResource("PolarBear", withExtension: "mov")!
//		controller.loginButtonColor = UIColor.purpleColor()
//		controller.setupOnePassword("YourAppName", appUrl: "YourAppURL")
    }
    
    @IBAction func butLoginTapped(sender: AnyObject) {
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: LFLoginControllerDelegate {
    
    func loginDidFinish(email: String, password: String, type: LFLoginController.SendType) {
        
        // Implement your server call here
        
        print(email)
        print(password)
        print(type)
        
        // Example
        if type == .Login && password != "1234" {
            
            controller.wrongInfoShake()
        } else {
            
            navigationController?.popViewController(animated: true)
        }
    }
    
    func forgotPasswordTapped() {
        
        print("forgot password")
    }
}
