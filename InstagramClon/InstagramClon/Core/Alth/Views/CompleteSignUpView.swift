//
//  CompleteSignUpView.swift
//  InstagramClon
//
//  Created by Fenuku kekeli on 7/28/23.
//

import SwiftUI

struct CompleteSignUpView: View {
    @Environment (\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegistrationViewModel
    var body: some View {
        VStack(spacing: 12){
            Spacer()
            Text ("Welcome to Instagram,\(viewModel.username)") 
                .font (.title2)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding (.top)
            
            Text("Click below to complete registration and start using Instagram")
                .font (. footnote)
           
            .multilineTextAlignment (.center)
            .padding (.horizontal, 24)
           

            Button {
                Task{try await  viewModel.createUser() }
            } label: {
                Text ("Complete SignUp")
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

struct CompleteSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteSignUpView()
    }
}
