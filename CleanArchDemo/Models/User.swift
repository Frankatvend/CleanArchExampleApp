//
//  User.swift
//  CleanArchDemo
//
//  Created by Frank Feng on 18/10/21.
//

import Foundation

struct User: Equatable, Hashable, Identifiable {
    var id = UUID()
    var username: String = ""
    var password: String = ""
}
