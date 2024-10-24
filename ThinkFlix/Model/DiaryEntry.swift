//
//  DiaryEntry.swift
//  ThinkFlix
//
//  Created by Reuben Simphiwe Kuse on 2024/10/23.
//

import Foundation

class DiaryEntry {
    var subject: String
    var entryType: String // "Assignment" or "Exam"
    var dueDate: Date
    var notes: String

    init(subject: String, entryType: String, dueDate: Date, notes: String) {
        self.subject = subject
        self.entryType = entryType
        self.dueDate = dueDate
        self.notes = notes
    }
}
