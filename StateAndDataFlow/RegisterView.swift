//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 18.05.2022.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject private var userManger: UserManager
    
    @State private var name = ""
    
    var body: some View {
        HStack {
            VStack {
                TextField("Enter your name...", text: $name)
                    .multilineTextAlignment(.center)
                Button(action: registerUser) {
                    HStack {
                        Image(systemName: "checkmark.circle")
                        Text("OK")
                    }
                }
                .disabled(hideButton())
            }
            Text("\(name.count)")
                .foregroundColor(changeCounterColor())
                .padding(.trailing)
        }
    }
    
    private func registerUser() {
            userManger.name = name
            StorageManager.shared.save(userName: name)
            userManger.isRegistered.toggle()
    }
    
    private func changeCounterColor() -> Color {
        if name.count < 3 {
            return .red
        }
        return.green
    }
    
    private func hideButton() -> Bool {
        if name.count < 3 {
            return true
        }
        return false
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
            .environmentObject(UserManager())
    }
}
