//
//  ProfileView.swift
//  ThinkFlix
//
//  Created by Reuben Simphiwe Kuse on 2024/10/23.
//

import Foundation
import UIKit

class ProfileView: UIView {
    
    // Profile section
    lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person.circle") // Placeholder
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 50
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.lightGray.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var gradeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var schoolLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Multiple selection buttons for grades
    lazy var gradeButtons: [UIButton] = {
        let grade11 = UIButton(type: .system)
        grade11.setTitle("Grade 11", for: .normal)
        grade11.addTarget(self, action: #selector(toggleGradeSelection(_:)), for: .touchUpInside)

        let grade12 = UIButton(type: .system)
        grade12.setTitle("Grade 12", for: .normal)
        grade12.addTarget(self, action: #selector(toggleGradeSelection(_:)), for: .touchUpInside)

        return [grade11, grade12]
    }()
    
    // Multiple selection buttons for subjects
    lazy var subjectButtons: [UIButton] = {
        let english = UIButton(type: .system)
        english.setTitle("English", for: .normal)
        english.addTarget(self, action: #selector(toggleSubjectSelection(_:)), for: .touchUpInside)

        let physicalScience = UIButton(type: .system)
        physicalScience.setTitle("Physical Science", for: .normal)
        physicalScience.addTarget(self, action: #selector(toggleSubjectSelection(_:)), for: .touchUpInside)

        let biology = UIButton(type: .system)
        biology.setTitle("Biology", for: .normal)
        biology.addTarget(self, action: #selector(toggleSubjectSelection(_:)), for: .touchUpInside)

        let mathematics = UIButton(type: .system)
        mathematics.setTitle("Mathematics", for: .normal)
        mathematics.addTarget(self, action: #selector(toggleSubjectSelection(_:)), for: .touchUpInside)

        return [english, physicalScience, biology, mathematics]
    }()
    
    // Diary Section
    lazy var diaryLabel: UILabel = {
        let label = UILabel()
        label.text = "My Diary"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var diaryDetailsLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = """
        Exam
        Subject: Physical Science
        Date: 22 February 2023
        Time: 11:00 AM
        Due Date: 6 Days

        Assignment
        Subject: English
        Date: 2 March 2023
        Time: 11:00 AM
        Days Left: 13 Days
        """
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var diaryTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DiaryEntryCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // Buttons for My Lectures and My Pictures
    lazy var lecturesButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("My Lectures / Videos", for: .normal)
        button.setImage(UIImage(systemName: "play.rectangle"), for: .normal)
        button.tintColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var picturesButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("My Pictures", for: .normal)
        button.setImage(UIImage(systemName: "photo"), for: .normal)
        button.tintColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // Toggle grade selection
    @objc func toggleGradeSelection(_ sender: UIButton) {
        sender.isSelected.toggle()
        sender.backgroundColor = sender.isSelected ? UIColor.systemBlue : UIColor.clear
    }
    
    // Toggle subject selection
    @objc func toggleSubjectSelection(_ sender: UIButton) {
        sender.isSelected.toggle()
        sender.backgroundColor = sender.isSelected ? UIColor.systemBlue : UIColor.clear
    }
    
    // Setup view layout
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    private func setupView() {
        // Profile section stack
        let profileStackView = UIStackView(arrangedSubviews: [profileImageView, nameLabel, gradeLabel, schoolLabel])
        profileStackView.axis = .vertical
        profileStackView.spacing = 8
        profileStackView.alignment = .center
        profileStackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Buttons for grades and subjects
        let gradeSelectionStackView = UIStackView(arrangedSubviews: gradeButtons)
        gradeSelectionStackView.axis = .horizontal
        gradeSelectionStackView.spacing = 10
        gradeSelectionStackView.alignment = .center
        gradeSelectionStackView.translatesAutoresizingMaskIntoConstraints = false

        let subjectSelectionStackView = UIStackView(arrangedSubviews: subjectButtons)
        subjectSelectionStackView.axis = .horizontal
        subjectSelectionStackView.spacing = 10
        subjectSelectionStackView.alignment = .center
        subjectSelectionStackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Buttons stack for My Lectures / Pictures
        let buttonStackView = UIStackView(arrangedSubviews: [lecturesButton, picturesButton])
        buttonStackView.axis = .horizontal
        buttonStackView.spacing = 20
        buttonStackView.alignment = .center
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false

        // Diary section
        let diaryStackView = UIStackView(arrangedSubviews: [diaryLabel, diaryDetailsLabel])
        diaryStackView.axis = .vertical
        diaryStackView.spacing = 10
        diaryStackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Main Stack View
        let mainStackView = UIStackView(arrangedSubviews: [profileStackView, buttonStackView, gradeSelectionStackView, subjectSelectionStackView, diaryStackView, diaryTableView])
        mainStackView.axis = .vertical
        mainStackView.spacing = 20
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(mainStackView)

        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            mainStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            mainStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }
}
