//
//  StorageManager.swift
//  StateAndDataFlow
//
//  Created by MAC  on 21.05.2022.
//

import Foundation

class StorageManager {
    static let shared = StorageManager()
    
    private let userDefaults = UserDefaults.standard
    private let userNameKey = "userName"
    
    private init() {}
    
    func save(userName: String) {
        userDefaults.set(userName, forKey: userNameKey)
    }
    
    func fetchUser() -> String {
        if let userName = userDefaults.string(forKey: userNameKey) {
            return userName
        }
        return ""
    }
    
    func deleteUser() {
        userDefaults.removeObject(forKey: userNameKey)
    }
    
    func isRegistered() -> Bool {
        if !fetchUser().isEmpty {
            return true
        }
        return false
    }
}
