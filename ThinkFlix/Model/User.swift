//
//  User.swift
//  ThinkFlix
//
//  Created by Reuben Simphiwe Kuse on 2024/10/22.
//

import Foundation
import UIKit

class User {
    var name: String
    var surname: String
    var idNumber: String
    var phoneNumber: String
    var province: String
    var profilePicture: UIImage? // Add a profile picture property

    init(name: String, surname: String, idNumber: String, phoneNumber: String, province: String, profilePicture: UIImage? = nil) {
        self.name = name
        self.surname = surname
        self.idNumber = idNumber
        self.phoneNumber = phoneNumber
        self.province = province
        self.profilePicture = profilePicture
    }
}
