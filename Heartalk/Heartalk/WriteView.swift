//
//  WritingView.swift
//  Heartalk
//
//  Created by Stefano Giacobbe on 12/06/23.
//

import SwiftUI
import PencilKit

struct WriteView: View {
    @State var writingText = ""
    var body: some View {
        TextField("Write your thoughts here...", text: $writingText, axis: .vertical)
            .frame(maxHeight: .infinity, alignment: .top)
            .padding([.horizontal, .top])
    }
}

struct WriteView_Previews: PreviewProvider {
    static var previews: some View {
        WriteView()
    }
}
