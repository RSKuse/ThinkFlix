//
//  ProfileViewController.swift
//  ThinkFlix
//
//  Created by Reuben Simphiwe Kuse on 2024/10/23.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController, UITableViewDataSource {
    let profileView = ProfileView()
    var diaryEntries: [DiaryEntry] = []
    var filteredDiaryEntries: [DiaryEntry] = [] // For storing filtered results

    override func loadView() {
        view = profileView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        view.backgroundColor = .white

        // Set user details
        profileView.nameLabel.text = "Sisipho Nkolo"
        profileView.gradeLabel.text = "Grade 11"
        profileView.schoolLabel.text = "Saint Augustine SS"
        profileView.profileImageView.image = UIImage(named: "yourProfileImage") // Set profile image
        
        // Set diary entries (example data)
        diaryEntries = [
            DiaryEntry(subject: "Physical Science", entryType: "Exam", dueDate: Date(), notes: "Prepare for Physics test."),
            DiaryEntry(subject: "English", entryType: "Assignment", dueDate: Date(), notes: "Submit essay on Shakespeare."),
            DiaryEntry(subject: "Mathematics", entryType: "Exam", dueDate: Date(), notes: "Practice algebra.")
        ]
        
        profileView.gradeButtons.forEach { button in
            button.addTarget(self, action: #selector(filterContent), for: .touchUpInside)
        }
        profileView.subjectButtons.forEach { button in
            button.addTarget(self, action: #selector(filterContent), for: .touchUpInside)
        }

        // Initially show all entries
        filteredDiaryEntries = diaryEntries
        profileView.diaryTableView.dataSource = self
    }

    // MARK: - Table View Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredDiaryEntries.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DiaryEntryCell", for: indexPath)
        let entry = filteredDiaryEntries[indexPath.row]
        cell.textLabel?.text = "\(entry.subject) - \(entry.entryType)"
        return cell
    }

    // MARK: - Filter Content Based on Selections
    @objc func filterContent() {
        let selectedGrades = profileView.gradeButtons.filter { $0.isSelected }.map { $0.title(for: .normal) }
        let selectedSubjects = profileView.subjectButtons.filter { $0.isSelected }.map { $0.title(for: .normal) }
        
        filteredDiaryEntries = diaryEntries.filter { entry in
            return selectedSubjects.contains(entry.subject)
        }

        profileView.diaryTableView.reloadData()
    }
}
