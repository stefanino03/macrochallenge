//
//  WritingView.swift
//  Heartalk
//
//  Created by Stefano Giacobbe on 12/06/23.
//

import SwiftUI
import PencilKit

struct WritingView: View, KeyboardReadable {
    @State var writingText = ""
    var body: some View {
        TextField("Write your thoughts here...", text: $writingText, axis: .vertical)
            .frame(maxHeight: .infinity, alignment: .top)
            .padding([.horizontal, .top])
    }
}

struct WritingView_Previews: PreviewProvider {
    static var previews: some View {
        WritingView()
    }
}
