//
//  SegmentedPicker.swift
//  Heartalk
//
//  Created by Stefano Giacobbe on 12/06/23.
//

import SwiftUI

struct SegmentedPicker: View
    {
        @Binding var isActive: Bool
        @Binding var selection: Int
        var body: some View
            {
                Picker("ciao", selection: $selection)
                    {
                        Text("Write").tag(0)
                        Text("Draw").tag(1)
                    }
                .padding()
                .pickerStyle(SegmentedPickerStyle())
                switch(selection)
                    {
                        case 0: WriteView()
                        case 1: DrawView(isActive: $isActive)
                        default: WriteView()
                    }
            }
    }

struct SegmentedPicker_Previews: PreviewProvider
    {
        static var previews: some View
            {
                SegmentedPicker(isActive: .constant(true), selection: .constant(1))
            }
    }

