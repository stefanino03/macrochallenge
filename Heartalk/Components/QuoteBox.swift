//
//  QuoteBox.swift
//  Heartalk
//
//  Created by Stefano Giacobbe on 15/06/23.
//

import SwiftUI

struct QuoteBox: View {
    @State var big: Bool
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .foregroundColor(.gray)
            .opacity(0.25)
            .frame(width: UIScreen.main.bounds.width - 60, height: big ? 400: 250)
        Text("\"Love is like a plant, the more you feed it, the more it grows.\"")
            .foregroundColor(.white)
            .font(.title)
            .multilineTextAlignment(.center)
            .frame(width: UIScreen.main.bounds.width - 130)
    }
}

struct QuoteBox_Previews: PreviewProvider {
    static var previews: some View {
        QuoteBox(big: true)
    }
}
