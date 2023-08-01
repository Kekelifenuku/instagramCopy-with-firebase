//
//  MainTabView.swift
//  InstagramClon
//
//  Created by Fenuku kekeli on 7/28/23.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedIndex = 0
    let user:User
    var body: some View {
        TabView(selection: $selectedIndex){
      FeedView()
                .onAppear {
                selectedIndex = 0
                }
            .tabItem {
                Image (systemName: "house")
            }.tag(0)
       SearchView()
                . onAppear {
                selectedIndex = 1
                }
                .tabItem {
                Image (systemName:
                        "magnifyingglass")
            }.tag(1)
            UploadPostView( tabindex: $selectedIndex )
                . onAppear {
                selectedIndex = 2 
                }
                .tabItem {
                Image (systemName: "plus.square")
                }.tag(2)
        Text ("Notifications")
                . onAppear {
                selectedIndex = 3
                }
                .tabItem {
                    Image (systemName: "heart")
                }.tag(3)
                        
            CurrentUserProfileview(user: user)
                . onAppear {
                selectedIndex = 4
                }.tag(4)
                .tabItem {
            Image (systemName: "person")
    }
        }.accentColor(.black) 
                }
                }
struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView(user: User.MOCK_USERS[0])
    }
}
