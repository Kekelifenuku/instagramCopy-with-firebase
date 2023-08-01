//
//  EditProfileView.swift
//  InstagramClon
//
//  Created by Fenuku kekeli on 7/30/23.
//

import SwiftUI
import PhotosUI 
import Kingfisher
struct EditProfileView: View {
    @Environment (\.dismiss) var dismiss
    @StateObject var viewModel = EditProfileViewModel(user: User.MOCK_USERS[0])
    init (user: User) {
        self._viewModel = StateObject (wrappedValue: EditProfileViewModel(user: user))
    }
    var body: some View {
        VStack{
            VStack {
                HStack  {
                    Button("cancel"){
                        dismiss()
                    }
                    Spacer()
                    Text ("Edit Profile")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    Spacer()
                    Button{
                        Task{ try await viewModel.updateUserData()
                            dismiss()
                        }
                    } label: {
                        Text ("Done")
                            .font(.subheadline)
                            .fontWeight(.bold)
                    }
                }
                
                .padding(.horizontal)
                Divider()
            }
            PhotosPicker (selection: $viewModel.selectedImage)
            {
                VStack{
                    if let image = viewModel.profileImage {
                        image 
                            .resizable()
                            .frame(width: 80, height: 80)
                            .foregroundColor (.white)
                            .background(.gray)
                            . clipShape(Circle())
                    } else {
                        
                        CircularProfileImageView(user: viewModel.user, size: .large)
                        
                    }
                     
                    Text ("Edit Profile")
                        .font (. subheadline)
                        .fontWeight (.semibold)
                    
                    Divider()
                }
            }
            .padding (.vertical, 8)
            VStack{
                EditProfileRowView(title: "Name" , placeholder: "Enter your name" , text:
                                    $viewModel.fullname)
                EditProfileRowView(title: "Bio" , placeholder: "Enter your Bio" , text:
                                    $viewModel.bio)
            }
            Spacer()
        }
    }
}

struct EditProfileRowView: View {
let title: String
let placeholder: String
@Binding var text: String

    var body: some View{
HStack {
    Text(title)
       
        .frame(width: 100, alignment: .leading)
        .padding(.leading, 8)
    VStack {
        TextField (placeholder, text: $text)
        Divider ( )
    }
}
.font(. subheadline)
.frame (height: 36)
}
}
struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView(user: User.MOCK_USERS[0])
    }
}
