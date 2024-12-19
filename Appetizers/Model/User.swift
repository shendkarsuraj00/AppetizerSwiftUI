//
//  User.swift
//  Appetizers
//
//  Created by Macbook on 16/12/24.
//

import SwiftUI

struct User: Codable {
    var firstname = ""
    var lastName = ""
    var email = ""
    var birthday = Date()
    var extranapkin  = false
    var frequantRefill = false
}
