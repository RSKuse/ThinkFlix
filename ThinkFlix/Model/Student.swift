//
//  Student.swift
//  ThinkFlix
//
//  Created by Reuben Simphiwe Kuse on 2024/10/23.
//

import Foundation

class Student: User {
    var grade: String
    var school: String
    var subjects: [String]

    init(name: String, surname: String, idNumber: String, phoneNumber: String, province: String, grade: String, school: String, subjects: [String]) {
        self.grade = grade
        self.school = school
        self.subjects = subjects
        super.init(name: name, surname: surname, idNumber: idNumber, phoneNumber: phoneNumber, province: province)
    }
}
