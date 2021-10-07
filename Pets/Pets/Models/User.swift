//
//  User.swift
//  Pets
//
//  Created by Uladzimir Kulakou on 10/3/21.
//

import Firebase
import Foundation

struct User {
    // MARK: Lifecycle

    init(user: Firebase.User) {
        self.uid = user.uid
        self.email = user.email ?? ""
    }

    // MARK: Internal

    // идентификатор пользователя
    let uid: String
    let email: String
}
