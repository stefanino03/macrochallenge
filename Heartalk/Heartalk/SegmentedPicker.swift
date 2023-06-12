//
//  SegmentedPicker.swift
//  Heartalk
//
//  Created by Stefano Giacobbe on 12/06/23.
//

import SwiftUI

struct SegmentedPicker: View {
    @Binding var selection: Int
    var body: some View {
        Picker("ciao", selection: $selection) {
            Text("Draw").tag(0)
            Text("Write").tag(1)
        }
        .padding()
        .pickerStyle(SegmentedPickerStyle())
        switch(selection) {
        case 0: DrawingView()
        default: WritingView()
        }
    }
}

struct SegmentedPicker_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedPicker(selection: .constant(1))
    }
}
