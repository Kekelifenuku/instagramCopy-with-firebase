//
//  ProfileView-.swift
//  InstagramClon
//
//  Created by Fenuku kekeli on 7/28/23.
//

import SwiftUI

struct ProfileView: View {
    let user: User
   
    
    var body: some View {

            ScrollView{
                
                ProfileHeaderView(user: user)
         
                    //            post
                    
                    PostGridView(user: user )
                
            }
            .navigationTitle("profile")
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }

struct ProfileView__Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User.MOCK_USERS[1])
    }
}
