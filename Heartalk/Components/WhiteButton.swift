//
//  WhiteButton.swift
//  Heartalk
//
//  Created by Stefano Giacobbe on 15/06/23.
//

import SwiftUI

struct WhiteButton: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.white)
                .opacity(0.8)
                .frame(width: 200, height: 150)
            Text("\"Love is like a plant, the more you feed it, the more it grows.\"")
                .font(.title3)
                .multilineTextAlignment(.center)
                .frame(width: 200, height: 150)
        }
    }
}

struct WhiteButton_Previews: PreviewProvider {
    static var previews: some View {
        WhiteButton()
    }
}
