//
//  WritingView.swift
//  Heartalk
//
//  Created by Stefano Giacobbe on 12/06/23.
//

import SwiftUI

struct WritingView: View {
    @State var writingText = ""
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.6)
                .foregroundColor(.white)
                .overlay {
                    TextField("Write your thoughts here...", text: $writingText, axis: .vertical)
                        .frame(maxHeight: .infinity, alignment: .top)
                        .padding()
                }
        }
    }
}

struct WritingView_Previews: PreviewProvider {
    static var previews: some View {
        WritingView()
    }
}
