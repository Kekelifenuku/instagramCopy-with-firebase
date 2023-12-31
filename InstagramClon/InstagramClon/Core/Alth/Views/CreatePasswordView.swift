//
//  CreatePasswordView.swift
//  InstagramClon
//
//  Created by Fenuku kekeli on 7/28/23.
//

import SwiftUI

struct CreatePasswordView: View {
    @EnvironmentObject var viewModel: RegistrationViewModel
    @Environment (\.dismiss) var dismiss
    var body: some View {
        VStack(spacing: 12){
            Text ("Create a password")
                .font (.title2)
                .fontWeight(.bold)
                .padding (.top)
            
            Text ("Your password must be at least 6 characters in length")
                .font (. footnote)
                .foregroundColor (.gray)
            .multilineTextAlignment (.center)
            .padding (.horizontal, 24)
            
            SecureField("Enter your password", text: $viewModel.password)
                .modifier (IGTextFieldModifier())

            NavigationLink {
           CompleteSignUpView()
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

struct CreatePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePasswordView()
    }
}
