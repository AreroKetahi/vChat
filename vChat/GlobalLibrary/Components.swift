//
//  Components.swift
//  vChat
//
//  Created by 苏子轩 on 2022/7/21.
//

import SwiftUI

struct PersonLabelComponent: View {
    @Environment(\.colorScheme) private var colorScheme
    var imageName: String?
    var nickname: String
    var body: some View {
        HStack {
            PersonHeadImage(imageName: imageName)

            Text(nickname)
                .foregroundColor(colorScheme == .light ? .black : .white)
                .shadow(color: Color(
                    colorScheme == .light ?
                    CGColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.3) :
                        CGColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 0.3)
                ),
                        radius: 1, x: 0, y: 0)
        }
    }
}

struct PersonLabelComponent_Previews: PreviewProvider {
    static var previews: some View {
        PersonLabelComponent(imageName: nil, nickname: "Test Name")
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
