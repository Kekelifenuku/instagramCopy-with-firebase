//
//  UploadPostViewModel.swift
//  InstagramClon
//
//  Created by Fenuku kekeli on 7/29/23.
//

import Foundation
import PhotosUI
import SwiftUI
import Firebase

@MainActor
class UploadPostViewModel: ObservableObject {
    @Published var selectedImage: PhotosPickerItem? {
        didSet { Task {  await loadImage(fromItem: selectedImage)} }
    }
    @Published var postImage: Image?
    private var uilmage: UIImage?
    func loadImage (fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        
        guard let data = try? await item.loadTransferable (type: Data.self) else { return }
        guard let uilmage = UIImage (data: data) else { return }
        self.uilmage = uilmage
        self.postImage = Image(uiImage: uilmage)
    }
    func uploadPost (caption: String) async throws {
        guard let uid = Auth.auth() .currentUser?.uid else { return }
        
        guard let uilmage = uilmage else { return }
        
        let postRef = Firestore.firestore().collection ("posts").document()
        guard let imageUrl = try await ImageUploader.uploadImage (image: uilmage) else { return }
        
        
        let post = Post(id: postRef.documentID, ownerUid: uid, caption: caption, likes: 0, imageUrl: imageUrl, timestamp: Timestamp())
        
        guard let encodedPost = try? Firestore.Encoder().encode (post) else { return }
        
        try await postRef.setData(encodedPost)
    }
}
  
  
