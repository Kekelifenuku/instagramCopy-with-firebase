//
//  CircularProfileImageView.swift
//  InstagramClon
//
//  Created by Fenuku kekeli on 7/31/23.
//

import SwiftUI
import Kingfisher


enum ProfileImageSize {
case xSmall
case small
case medium
case large

var dimension: CGFloat {
    switch self {
    case .xSmall:
        return 40
    case .small:
        return 48
    case .medium:
        return 64
    case .large:
        return 80
        
    }
}
}
struct CircularProfileImageView: View {
    let user: User
    let size: ProfileImageSize
    var body: some View {
        if let   ImageUrl = user.profileImageUrl {
            KFImage(URL(string: ImageUrl)!)
                .resizable()
                .scaledToFill()
                .frame (width: size.dimension, height: size.dimension)
                .clipShape(Circle())
        } else {
            Image (systemName: "person.circle.fill")
            .resizable()
            .frame (width: size.dimension, height: size.dimension)
            .clipShape(Circle())
            .foregroundColor(.gray)
        }
    }
}
    struct CircularProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProfileImageView(user: User.MOCK_USERS[1], size: .large)
    }
}
