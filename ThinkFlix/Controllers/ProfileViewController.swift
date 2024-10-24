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
        
        // Set diary entries
        diaryEntries = [
            DiaryEntry(subject: "Physical Science", entryType: "Exam", dueDate: Date(), notes: "Prepare for Physics test."),
            DiaryEntry(subject: "English", entryType: "Assignment", dueDate: Date(), notes: "Submit essay on Shakespeare.")
        ]

        profileView.diaryTableView.dataSource = self
    }

    // MARK: - Table View Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return diaryEntries.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DiaryEntryCell", for: indexPath)
        let entry = diaryEntries[indexPath.row]
        cell.textLabel?.text = "\(entry.subject) - \(entry.entryType)"
        return cell
    }
}
