//
//  PersonHeadImage.swift
//  vChat
//
//  Created by 苏子轩 on 2022/7/1.
//

import SwiftUI

struct PersonHeadImage: View {
    @Environment(\.colorScheme) var colorScheme
    var imageName: String
    var body: some View {
        Image(imageName)
            .resizable()
            .frame(width: 49, height: 49)
            .cornerRadius(8,antialiased: true)
            .shadow(color: Color(CGColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.3)),
                    radius: 3)
            .overlay(Rectangle().foregroundColor(Color(.displayP3, red: 1, green: 1, blue: 1, opacity: 0))
                .overlay(RoundedRectangle(cornerRadius: 8,style: .continuous)
                    .stroke(
                        colorScheme == .light ?
                        Color(.displayP3, red: 0.8, green: 0.8, blue: 0.8, opacity: 0.5) :
                            Color(.displayP3, red: 0.3, green: 0.3, blue: 0.3, opacity: 0.9)
                        ,lineWidth: 1)
                )
            )
    }
}

struct PersonHeadImage_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PersonHeadImage(imageName: "TestImage")
            PersonHeadImage(imageName: "TestImage")
                .preferredColorScheme(.dark)
        }
        .previewLayout(.fixed(width: 100, height: 100))
    }
}
