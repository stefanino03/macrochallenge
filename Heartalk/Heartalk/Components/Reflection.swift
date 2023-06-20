//
//  WhiteButton.swift
//  Heartalk
//
//  Created by Stefano Giacobbe on 15/06/23.
//

import SwiftUI

struct card
    {
        static let cardc = Color("cardc")
    }

struct Reflection: View
    {
        
        var body: some View
            {
                ZStack
                    {
                        ZStack
                            {
                                RoundedRectangle(cornerRadius: 20)
                                .stroke(.pink, lineWidth: 3)
                                RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(.white)
                            }
                        .frame(width: UIScreen.main.bounds.width - 60, height: 150)
                        VStack
                            {
                                Text("21/06/23")
                                .foregroundColor(.pink)
                                .bold()
                                .offset(x: (-UIScreen.main.bounds.width / 4) - 20)
                                Text("\"Love is like a plant, the more you feed it, the more it grows.\"")
                                .foregroundColor(.black)
                                .font(.title3)
                                .multilineTextAlignment(.center)
                                .frame(width: UIScreen.main.bounds.width - 90, height: 90)
                            }
                    }
            }
    }

struct Reflection_Previews: PreviewProvider
    {
        static var previews: some View
            {
                Reflection()
            }
    }
