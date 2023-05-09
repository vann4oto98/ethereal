//
//  LoginView.swift
//  ethereal
//
//  Created by Vanyo Ivanov on 5.05.23.
//

import SwiftUI

struct LoginView: View {
    @StateObject var loginModel: LoginViewModel = LoginViewModel()
    @EnvironmentObject var userSettings: UserSettings
    
    var body: some View {
        VStack {
            Image("logo")
            .scaledToFit()
            .padding(.top, 150)
            .padding(.bottom, 50)
            VStack(alignment: .leading,
                   spacing: 20,
                   content: {
                Text("Log in")
                    .frame(
                        maxWidth: .infinity,
                        alignment: .leading)
                    .padding(.horizontal, 50)
                    .font(.system(size: 30, weight: .semibold))
                    .foregroundColor(Color("main"))
                TextField("Email", text: $loginModel.email)
                    .padding(15)
                    .background(.white)
                    .cornerRadius(15)
                    .padding(.horizontal, 50)
                HStack {
                    if (loginModel.eyeIcon == "eye.slash") {
                        SecureField("Password", text: $loginModel.password)
                    } else {
                        TextField("Password", text: $loginModel.password)
                    }
                    
                    Button(action: loginModel.toggleEye) {
                        Image(loginModel.eyeIcon)
                    }
                    
                }
                .padding(15)
                .background(.white)
                .cornerRadius(15)
                .padding(.horizontal, 50)
                if (loginModel.hasError) {
                    Text("Invalid login credentials")
                        .foregroundColor(.red)
                        .font(.system(size: 20, weight: .bold))
                        .padding(.horizontal, 50)
                }
                
                Button(action: {
                    let isSuccess = loginModel.signIn()
                    userSettings.authenticated = isSuccess
                }) {
                        Text("Log In")
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                    }
                    .frame(
                        maxWidth: .infinity,
                        alignment: .center)
                    .padding(.horizontal, 30)
                    .padding(.vertical, 15)
                    .background(Color("main"))
                    .cornerRadius(30)
                    .padding(.top, 30)
                    .padding(.horizontal, 50)
            })

            Spacer()
        }
        .background(Image("background"))
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
