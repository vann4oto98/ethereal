//
//  MainView.swift
//  ethereal
//
//  Created by Vanyo Ivanov on 9.05.23.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var userSettings: UserSettings
    
    var body: some View {
        if (userSettings.authenticated == true) {
            ProductDetails()
        } else {
            LoginView()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(UserSettings())
    }
}
