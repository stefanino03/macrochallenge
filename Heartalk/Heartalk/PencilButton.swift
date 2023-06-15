//
//  PencilButton.swift
//  Heartalk
//
//  Created by Stefano Giacobbe on 09/06/23.
//

import SwiftUI
import PencilKit

struct PencilButton: View
{
    @Binding var isActive: Bool
    var body: some View
    {
        Button
        {
            self.isActive.toggle()
        }
    label:
        {
            Image(systemName: "pencil.tip.crop.circle")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
        }
    }
}

struct PencilButton_Previews: PreviewProvider
{
    static var previews: some View
    {
        PencilButton(isActive: .constant(true))
    }
}
