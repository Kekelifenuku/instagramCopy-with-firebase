//
//  FeedViewModel.swift
//  InstagramClon
//
//  Created by Fenuku kekeli on 8/1/23.
//

import Foundation
import Firebase


@MainActor
class FeedViewModel: ObservableObject {
    
    @Published var posts = [Post]()
    
    init() {
        Task { try await fetchPosts() }
        }
    
    @MainActor
    func fetchPosts() async throws {
        self.posts = try await PostService.fetchFeedPosts()
        
    } 
}
 
