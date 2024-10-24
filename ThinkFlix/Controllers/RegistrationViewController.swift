//
//  RegistrationViewController.swift
//  ThinkFlix
//
//  Created by Reuben Simphiwe Kuse on 2024/10/23.
//

import Foundation
// RegistrationViewController.swift
import UIKit

class RegistrationViewController: UIViewController {
    let registrationView = RegistrationView()

    override func loadView() {
        view = registrationView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Register"
        view.backgroundColor = .gray
        
        // After registering, you can list all users
        print("Users in database: \(MockDatabase.fetchUsers())")
        
        // Set up button action to navigate to Profile page registration
        registrationView.registerButton.addTarget(self, action: #selector(navigateToProfile), for: .touchUpInside)
    }

    @objc func navigateToProfile() {
        let profileVC = ProfileViewController() // Create instance of ProfileViewController
        navigationController?.pushViewController(profileVC, animated: true) // Push ProfileViewController onto navigation stack
    }
}
