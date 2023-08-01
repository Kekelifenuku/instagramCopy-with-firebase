//
//  SearchViewModel.swift
//  InstagramClon
//
//  Created by Fenuku kekeli on 7/30/23.
//



import Foundation
class SearchViewModel: ObservableObject {
    @Published var users = [User]()
    init() {
        Task { try await fetchAllUsers () }
        
    }
    @MainActor
    func fetchAllUsers() async throws {
        self.users = try await UserService .fetchAllUsers ()
        }
        
    }

