//
//  StarButton.swift
//  Heartalk
//
//  Created by Stefano Giacobbe on 15/06/23.
//

import SwiftUI

struct StarButton: View {
    @Binding var star: Bool
    var body: some View {
        Image(systemName: "star.fill")
            .resizable()
            .frame(width: 40, height: 40)
            .opacity(star ? 1 : 0)
            .foregroundColor(.yellow)
        Button
        {
            star.toggle()
        }
    label:
        {
            Image(systemName: "star.circle.fill")
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundColor(.white)
        }    }
}

struct StarButton_Previews: PreviewProvider {
    static var previews: some View {
        StarButton(star: .constant(true))
    }
}
