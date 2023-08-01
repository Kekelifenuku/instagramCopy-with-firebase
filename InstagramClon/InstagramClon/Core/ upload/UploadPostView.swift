//
//  UploadPostView.swift
//  InstagramClon
//
//  Created by Fenuku kekeli on 7/29/23.
//

import SwiftUI
import PhotosUI
struct UploadPostView: View {
    @State private var caption = ""
    @State private var imagePickerPresented = false
    @StateObject var viewModel = UploadPostViewModel ()
    @Binding var tabindex: Int
    var body: some View {
        VStack{
            HStack{
                Button{
                    clearPostDataÄndReturnToFeed()
                } label: {
                    Text ("Cancel")
                        .fontWeight(.semibold)
                }
                
                Spacer()
                Text ("New Post" )
                    .fontWeight(.semibold)
                Spacer()
                
                Button{
                    Task{
                        try await viewModel.uploadPost (caption: caption)
                        clearPostDataÄndReturnToFeed()
                    }
                } label: {
                    Text ("Upload")
                        .fontWeight(.semibold)
                }
            }
            .padding(.horizontal )
            HStack(spacing: 8){
                if let image = viewModel.postImage {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipped()
                }
                TextField("Enter your caption...",  text: $caption, axis: .vertical)
            }
            
            
            
            .padding()
            Spacer()
        }
        .onAppear{
            imagePickerPresented.toggle()
        }
        .photosPicker(isPresented: $imagePickerPresented , selection:  $viewModel.selectedImage )
    }
    func clearPostDataÄndReturnToFeed(){
        caption = ""
        viewModel.selectedImage = nil
        viewModel.postImage = nil
        tabindex = 0
    }
    
}
struct UploadPostView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPostView( tabindex: .constant(1))
    }
}
