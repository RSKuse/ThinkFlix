//
//  RegistrationView.swift
//  ThinkFlix
//
//  Created by Reuben Simphiwe Kuse on 2024/10/23.
//

import Foundation
// RegistrationView.swift
import UIKit

class RegistrationView: UIView {
    lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your name"
        textField.borderStyle = .roundedRect
        return textField
    }()

    lazy var surnameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your surname"
        textField.borderStyle = .roundedRect
        return textField
    }()

    lazy var idNumberTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your ID number"
        textField.borderStyle = .roundedRect
        return textField
    }()

    lazy var phoneNumberTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your phone number"
        textField.borderStyle = .roundedRect
        return textField
    }()

    lazy var provinceTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your province"
        textField.borderStyle = .roundedRect
        return textField
    }()

    lazy var registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Register", for: .normal)
        button.addTarget(self, action: #selector(registerTapped), for: .touchUpInside)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    private func setupView() {
        let stackView = UIStackView(arrangedSubviews: [nameTextField, surnameTextField, idNumberTextField, phoneNumberTextField, provinceTextField, registerButton])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 300)
        ])
    }

    @objc private func registerTapped() {
        guard let name = nameTextField.text, !name.isEmpty,
              let surname = surnameTextField.text, !surname.isEmpty,
              let idNumber = idNumberTextField.text, !idNumber.isEmpty,
              let phoneNumber = phoneNumberTextField.text, !phoneNumber.isEmpty,
              let province = provinceTextField.text, !province.isEmpty else {
            print("Error: All fields are required.")
            return
        }

        // Register the user
        let student = Student(name: name, surname: surname, idNumber: idNumber, phoneNumber: phoneNumber, province: province, grade: "11", school: "Sample School", subjects: ["Math", "Science"])
        MockDatabase.registerUser(student)
    }
}
