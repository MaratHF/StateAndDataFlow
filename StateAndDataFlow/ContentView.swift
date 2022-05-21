//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 18.05.2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var user: UserManager
    @StateObject private var timer = TimeCounter()
    
    var body: some View {
        VStack {
            Text("Hi, \(user.name)")
                .font(.largeTitle)
                .padding(.top, 50)
            Text("\(timer.counter)")
                .font(.largeTitle)
                .padding(.top, 80)
            Spacer()
            ButtonView(
                action: timer.startTimer,
                text: timer.buttonTitle,
                color: .red
            )
            Spacer()
            ButtonView(action: logOut, text: "LogOut", color: .blue)
            .padding(.bottom)
        }
    }
    
    private func logOut() {
        StorageManager.shared.deleteUser()
        user.isRegistered.toggle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserManager())
    }
}

struct ButtonView: View {
    let action: () -> Void
    let text: String
    let color: Color
    
    var body: some View {
        Button(action: action) {
            Text(text)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(width: 200, height: 60)
        .background(color)
        .cornerRadius(20)
        .overlay {
            RoundedRectangle(cornerRadius: 20).stroke(.black, lineWidth: 4)
        }
    }
}
