//
//  User.swift
//  Appetizers
//
//  Created by Zach Uptin on 6/10/2022.
//

import Foundation

struct User: Codable {
    var firstName       = ""
    var lastName        = ""
    var email           = ""
    var birthday        = Date()
    var extraNapkins    = false
    var frequentRefills = false
}
