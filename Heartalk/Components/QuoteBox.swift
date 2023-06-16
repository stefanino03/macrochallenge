//
//  QuoteBox.swift
//  Heartalk
//
//  Created by Stefano Giacobbe on 15/06/23.
//

import SwiftUI

struct QuoteBox: View
    {
        @State var star: Bool = false
        var body: some View
            {
                ZStack
                    {
                        Image("card")
                        .resizable()
                        .shadow(color: .black, radius: 20)
                        .frame(width: UIScreen.main.bounds.width - 60, height: 250)
                        VStack
                            {
                                HStack
                                    {
                                        ShareLink(item: "Share quote")
                                            {
                                                Image(systemName: "square.and.arrow.up")
                                                .resizable()
                                                .foregroundColor(.black)
                                                .bold()
                                                .frame(width: 20, height: 25)
                                            }
                                        Spacer()
                                        Image(systemName: "star.fill")
                                        .resizable()
                                        .foregroundColor(star ? .pink : .black)
                                        .bold()
                                        .frame(width: 27, height: 25)
                                        .onTapGesture
                                            {
                                                    star.toggle()
                                            }
                                    }
                                .frame(width: 70)
                                .offset(x: 110)
                                Text("\"Love is like a plant, the more you feed it, the more it grows.\"")
                                .foregroundColor(.black)
                                .font(.title3)
                                .bold()
                                .multilineTextAlignment(.center)
                                .frame(width: UIScreen.main.bounds.width - 180, height: 160)
                            }
                    }
            }
    }

struct QuoteBox_Previews: PreviewProvider
    {
        static var previews: some View
            {
                QuoteBox()
            }
    }
