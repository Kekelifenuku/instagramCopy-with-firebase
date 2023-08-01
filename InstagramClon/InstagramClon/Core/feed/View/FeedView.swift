//
//  FeedView.swift
//  InstagramClon
//
//  Created by Fenuku kekeli on 7/28/23.
//

import SwiftUI
import Kingfisher
import Firebase
struct FeedView: View {
    @StateObject var viewModel = FeedViewModel ()
    var body: some View {
        
        NavigationStack {
            ScrollView{
                LazyVStack(spacing: 32){
                    ForEach (viewModel.posts) { post in
                        FeedCell(post: post)
                    }
                    
                }
                .padding(.top,8)
            }
            .navigationTitle("Feed")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem (placement: .navigationBarTrailing) {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
               
                }
            }
        }
    }
}
struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
