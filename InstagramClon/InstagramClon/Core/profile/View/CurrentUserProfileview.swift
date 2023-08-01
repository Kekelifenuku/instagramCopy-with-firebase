//
//  CurrentUserProfileview.swift
//  InstagramClon
//
//  Created by Fenuku kekeli on 7/29/23.
//

import SwiftUI

struct CurrentUserProfileview: View {
    let user: User
    
      
    private let imageDimension: CGFloat = (UIScreen.main.bounds .width / 3) - 1
    var body: some View {
        NavigationStack{
            ScrollView{
                ProfileView(user: user)
                
                //            post
                PostGridView(user: user)
            }
            
            .navigationTitle("profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        AuthService.shared.signout()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
}
struct CurrentUserProfileview_Previews: PreviewProvider {
    static var previews: some View {
        CurrentUserProfileview(user: User.MOCK_USERS[0])
    }
}

