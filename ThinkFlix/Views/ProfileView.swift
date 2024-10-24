//
//  ProfileView.swift
//  ThinkFlix
//
//  Created by Reuben Simphiwe Kuse on 2024/10/23.
//

import Foundation
import UIKit

class ProfileView: UIView {
    
    lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person.circle") // Placeholder image
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 50
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.lightGray.cgColor
        return imageView
    }()

    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    lazy var gradeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()

    lazy var schoolLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()
    
    // Lectures and Pictures buttons
    lazy var lecturesButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("My Lectures / Videos", for: .normal)
        button.setImage(UIImage(systemName: "play.rectangle"), for: .normal)
        button.tintColor = .systemBlue
        return button
    }()

    lazy var picturesButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("My Pictures", for: .normal)
        button.setImage(UIImage(systemName: "photo"), for: .normal)
        button.tintColor = .systemBlue
        return button
    }()
    
    // Diary TableView
    lazy var diaryTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DiaryEntryCell")
        return tableView
    }()
    
    // Filters
    lazy var gradeFilterLabel: UILabel = {
        let label = UILabel()
        label.text = "Filter by Grades:"
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    lazy var gradeFilterControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["Grade 11", "Grade 12"])
        return control
    }()
    
    lazy var subjectFilterLabel: UILabel = {
        let label = UILabel()
        label.text = "Filter by Subjects:"
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    lazy var subjectFilterControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["English", "Physical Science", "Biology", "Mathematics"])
        return control
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
        // Stack View for Profile Information
        let profileStackView = UIStackView(arrangedSubviews: [profileImageView, nameLabel, gradeLabel, schoolLabel])
        profileStackView.axis = .vertical
        profileStackView.spacing = 10
        profileStackView.alignment = .center
        
        // Stack View for buttons (Lectures, Pictures)
        let buttonStackView = UIStackView(arrangedSubviews: [lecturesButton, picturesButton])
        buttonStackView.axis = .horizontal
        buttonStackView.spacing = 20
        buttonStackView.alignment = .center
        
        // Filters StackView
        let filterStackView = UIStackView(arrangedSubviews: [gradeFilterLabel, gradeFilterControl, subjectFilterLabel, subjectFilterControl])
        filterStackView.axis = .vertical
        filterStackView.spacing = 10
        
        let mainStackView = UIStackView(arrangedSubviews: [profileStackView, buttonStackView, filterStackView, diaryTableView])
        mainStackView.axis = .vertical
        mainStackView.spacing = 20
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(mainStackView)

        // Set constraints for mainStackView
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            mainStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            mainStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            
            profileImageView.heightAnchor.constraint(equalToConstant: 100),
            profileImageView.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
}
