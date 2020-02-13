//
//  LoginViewController.swift
//  MyChatApp
//
//  Created by Sebastian Mayorga on 2/11/20.
//  Copyright © 2020 Sebastian Mayorga. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let loginView: LoginView = LoginView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.loginView)
        NSLayoutConstraint.activate([
            self.loginView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.loginView.leftAnchor.constraint(equalTo:self.view.leftAnchor),
            self.loginView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            self.loginView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
