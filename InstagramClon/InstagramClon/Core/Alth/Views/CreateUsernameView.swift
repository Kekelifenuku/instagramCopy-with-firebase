//
//  CreateUsernameView.swift
//  InstagramClon
//
//  Created by Fenuku kekeli on 7/28/23.
//

import SwiftUI

struct CreateUsernameView: View {
    @EnvironmentObject var viewModel: RegistrationViewModel
    @Environment (\.dismiss) var dismiss
    var body: some View {
        VStack(spacing: 12){
            Text ("Create username")
                .font (.title2)
                .fontWeight(.bold)
                .padding (.top)
            
            Text ("You'll use this email to sign in to your account")
                .font (. footnote)
                .foregroundColor (.gray)
            .multilineTextAlignment (.center)
            .padding (.horizontal, 24)
            
            TextField("Enter your username", text: $viewModel.username)
                .autocapitalization (.none)
                .modifier (IGTextFieldModifier())

            NavigationLink {
                CreatePasswordView()
                    .navigationBarBackButtonHidden(true)
            } label: {
                Text ("Next")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 44)
                    .foregroundColor(.white)
                    .background(Color(.systemBlue))
                    .cornerRadius(8)
            }
           
            .padding(.vertical)
            
            Spacer()
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Image(systemName: "chevron.left")
                            .imageScale(. large)
                            .onTapGesture {
                            dismiss()
                            }
                    }
            }
        }
    }
}

struct CreateUsernameView_Previews: PreviewProvider {
    static var previews: some View {
        CreateUsernameView()
    }
}
