//
//  AddEmailView.swift
//  InstagramClon
//
//  Created by Fenuku kekeli on 7/28/23.
//

import SwiftUI

struct AddEmailView: View {
    
    @Environment (\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegistrationViewModel
    var body: some View {
       NavigationStack {
            VStack(spacing: 12){
                Text ("Add your email")
                    .font (.title2)
                    .fontWeight(.bold)
                    .padding (.top)
                
                Text ("You'll use this email to sign in to your account")
                    .font (. footnote)
                    .foregroundColor (.gray)
                .multilineTextAlignment (.center)
                .padding (.horizontal, 24)
                
                TextField("Enter your email", text: $viewModel.email)
                    .autocapitalization (.none)
                    .modifier (IGTextFieldModifier())

                NavigationLink {
                    CreateUsernameView()
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
            }
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
struct AddEmailView_Previews: PreviewProvider {
    static var previews: some View {
        AddEmailView()
    }
}
