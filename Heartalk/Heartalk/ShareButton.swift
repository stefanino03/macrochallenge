//
//  ShareButton.swift
//  Heartalk
//
//  Created by Stefano Giacobbe on 12/06/23.
//

import SwiftUI

struct ShareButton: View
{
    var body: some View
    {
        ShareLink(item: "OK")
        {
            Image(systemName: "square.and.arrow.up.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .foregroundColor(.teal)
        }
    }
}

struct Quote: Identifiable
{
    var id = UUID()
    var text: String
}

extension Quote: Transferable
{
    static var transferRepresentation: some TransferRepresentation
    {
        ProxyRepresentation(exporting: \.text)
    }
}

struct ShareButton_Previews: PreviewProvider
{
    static var previews: some View
    {
        ShareButton()
    }
}
