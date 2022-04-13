//
//  UrlImageView.swift
//  RandomUserWithCombine
//
//  Created by Sy Lee on 2022/04/12.
//

import SwiftUI

struct UrlImageView: View {
    var randomuser: RandomUser
    
    init(_ randomUser: RandomUser) {
        self.randomuser = randomUser
    }
    
    var body: some View {
        HStack {
            AsyncImage(url: randomuser.profileImgUrl) { phase in
                if let image = phase.image {
                    image // Displays the loaded image.
                } else if phase.error != nil {
                    Color.red // Indicates an error.
                } else {
                    ProgressView() // Acts as a placeholder.
                }
            }
            .clipShape(Circle())
            .frame(width: 80, height: 80)
            .overlay {
                Circle().stroke(.yellow, lineWidth: 2)
            }
            Spacer()
            VStack {
                Text(randomuser.name.first)
                    .font(.headline)
                Text(randomuser.name.last)
                    .font(.headline)
                Text(randomuser.location.country.rawValue)
                    .font(.caption)
            }
        }
        .padding()
  }
}
