//
//  UserViewModel.swift
//  SkateSpotsMap
//
//  Created by Cameron Wu on 11/7/23.
//

import Foundation

class UserViewModel: ObservableObject {
    private var userRepository = UserRepository()

    init() {
    }

    func add(user: User) {
        userRepository.create(user)
    }
  
    func destroy(user: User) {
        userRepository.delete(user)
    }
}
