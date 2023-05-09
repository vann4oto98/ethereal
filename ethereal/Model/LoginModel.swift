//
//  LoginModel.swift
//  ethereal
//
//  Created by Vanyo Ivanov on 7.05.23.
//

import SwiftUI

let DUMMY_EMAIL = "Test@test.com"
let DUMMY_PASSWORD = "1234"

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var eyeIcon: String = "eye.slash"
    @Published var hasError: Bool = false
    
    func signIn() -> Bool {
        if (email != DUMMY_EMAIL || password != DUMMY_PASSWORD) {
            hasError = true
            return false
        } else {
            hasError = false
            email = ""
            password = ""
            return true
        }

    }
    
    func toggleEye() -> Void {
        if (eyeIcon == "eye.slash") {
            eyeIcon = "eye"
        } else {
            eyeIcon = "eye.slash"
        }
    }
}
