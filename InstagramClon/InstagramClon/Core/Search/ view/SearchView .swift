//
//  SearchView .swift
//  InstagramClon
//
//  Created by Fenuku kekeli on 7/28/23.
//

import SwiftUI
import Kingfisher
struct SearchView: View {
    @State private var searchText = ""
    @StateObject var viewModel = SearchViewModel()
    var body: some View {
        NavigationStack {
            ScrollView{
                LazyVStack(spacing: 12){
                    ForEach(viewModel.users) { user in
                        NavigationLink(value: user){
                            HStack {
                                CircularProfileImageView(user: user, size: .xSmall)
                                VStack(alignment: .leading){
                                    Text(user.username )
                                        .fontWeight(.bold)
                                    if let fullname = user.fullname {
                                        Text(fullname)
                                            .font(.footnote)
                                    }
                                }
                                .font(.footnote)
                                Spacer()
                            }
                            .foregroundColor(.black)
                            .padding(.horizontal)
                        }
                    }
                }
                .padding(. top, 8)
                .searchable(text: $searchText, prompt: "Search " )
            }
            .navigationDestination(for: User.self, destination: { user in
                ProfileView(user: user)
            })
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SearchView__Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
