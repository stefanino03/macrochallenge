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

struct ShareButton_Previews: PreviewProvider
    {
        static var previews: some View
            {
                ShareButton()
            }
    }
