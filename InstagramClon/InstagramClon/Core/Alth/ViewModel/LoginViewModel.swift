//
//  LoginViewModel.swift
//  InstagramClon
//
//  Created by Fenuku kekeli on 7/29/23.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    func signIn() async throws {
      try await  AuthService.shared.login (withEmail: email, password: password)
    }
    
}
