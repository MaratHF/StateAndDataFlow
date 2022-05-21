//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 18.05.2022.
//

import Foundation

final class UserManager: ObservableObject {
    @Published var isRegistered = StorageManager.shared.isRegistered()
    var name = StorageManager.shared.fetchUser()
}
