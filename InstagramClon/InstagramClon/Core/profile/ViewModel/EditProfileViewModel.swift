//
//  EditProfileViewModel.swift
//  InstagramClon
//
//  Created by Fenuku kekeli on 7/31/23.
//

import SwiftUI
import PhotosUI
import Firebase
@MainActor
class EditProfileViewModel: ObservableObject {
    @Published var user: User
    @Published var selectedImage: PhotosPickerItem? {
        didSet { Task {  await loadImage(fromItem: selectedImage)} }
    }
    @Published var profileImage: Image?
    
      @Published var fullname = ""
      @Published  var bio = ""
    
    private var uilmage: UIImage?
    
    init (user: User) {
        self.user = user
        
        
        if let fullname = user.fullname {
            self.fullname = fullname
        }
        if let bio = user.bio {
            
            self.bio = bio
        }
    }
    
    
    func loadImage (fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        
        guard let data = try? await item.loadTransferable (type: Data.self) else { return }
        guard let uilmage = UIImage (data: data) else { return }
        self.uilmage = uilmage
        self.profileImage = Image(uiImage: uilmage)
    }
    
    func updateUserData() async throws {
//       update profile image if changed
        var data = [String: Any]()
        
        if let uilmage = uilmage {
            let imageUrl = try? await  ImageUploader.uploadImage (image: uilmage)
            data[ "profileImageUrl "] = imageUrl
        }
        
        //       update profile name if changed
        if !fullname.isEmpty && user.fullname != fullname {
      
            data["fullname" ] = fullname
        }
                
        //       update profile bio if changed
        if !bio.isEmpty && user.bio != bio {
         
            data["bio" ] = bio
        }
        if !data.isEmpty {
            try await Firestore.firestore().collection("users").document(user.id).updateData(data)
        }
    }
}
