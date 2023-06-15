//
//  ShareButton.swift
//  Heartalk
//
//  Created by Stefano Giacobbe on 15/06/23.
//

import SwiftUI

struct ShareButton: View {
    var body: some View {
        ShareLink(item: "Share quote")
        {
            Image(systemName: "square.and.arrow.up.circle.fill")
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundColor(.white)
        }    }
}

struct ShareButton_Previews: PreviewProvider {
    static var previews: some View {
        ShareButton()
    }
}
