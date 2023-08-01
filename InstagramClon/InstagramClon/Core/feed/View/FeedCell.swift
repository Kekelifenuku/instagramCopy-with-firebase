//
//  FeedCell.swift
//  InstagramClon
//
//  Created by Fenuku kekeli on 7/28/23.
//

import SwiftUI
import Kingfisher
struct FeedCell: View {
    let post: Post
    var body: some View {
        VStack{
//            image + user
            HStack{
                if let user = post.user {
                    CircularProfileImageView(user: user, size:.xSmall)
                    Text (user.username)
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                    Spacer()
                
            } .padding(.leading, 8)
//            post image
            KFImage(URL(string: post.imageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: 400, height: 400)
                .clipShape(Rectangle())
            
//            actionbutton
            HStack(spacing: 16){
                Button {
                print("Like post" )
                } label: {
                    Image (systemName: "heart")
                        .imageScale(.large)
                }
                Button {
                print("Like post" )
                } label: {
                    Image (systemName: "bubble.right")
                        .imageScale(.large)
                }
                Button {
                print("Like post" )
                } label: {
                    Image (systemName: "paperplane")
                        .imageScale(.large)
                }
                Spacer()
            }
            .padding(.leading, 8)
            .padding(.top, 4)
            .foregroundColor(.black)
            
//likes
            Text ("\(post.likes)Likes")
                .font (.footnote)
            .fontWeight (.semibold)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding (.leading, 10)
                .padding(.top, 1)
            
//            caption
            HStack {
                Text ("\(post.user?.username ?? "" ) ").fontWeight (.semibold) +
                Text (post.caption)
            }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font (. footnote)
                    .padding (.leading, 10)
                    .padding (.top, 1)
            
//
            Text ("6h ago")
            .font (. footnote)
           .frame(maxWidth: .infinity, alignment: .leading)
            .padding (.leading, 10)
           .padding (. top, 1)
           . foregroundColor (.gray)
        }
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell(post: Post.MOCK_POSTS[0])
    }
}
