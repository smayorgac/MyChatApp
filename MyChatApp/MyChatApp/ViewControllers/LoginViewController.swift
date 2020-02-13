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
        setUp()
        self.loginView.bindings(vm: LoginViewModel())
    }
    
    func setUp() {
        super.viewDidLoad()
        self.view.addSubview(self.loginView)
        self.loginView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.loginView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.loginView.leftAnchor.constraint(equalTo:self.view.leftAnchor),
            self.loginView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            self.loginView.heightAnchor.constraint(equalTo: self.view.heightAnchor)
        ])
    }
}
