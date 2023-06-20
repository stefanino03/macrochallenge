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
                        RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.pink)
                        .frame(width: UIScreen.main.bounds.width - 60, height: 250)
                        ZStack
                            {
                                HStack
                                    {
                                        ShareLink(item: "Share quote")
                                            {
                                                Image(systemName: "square.and.arrow.up")
                                                .resizable()
                                                .foregroundColor(.white)
                                                .bold()
                                                .frame(width: 20, height: 25)
                                            }
                                        Spacer()
                                        Image(systemName: star ? "star.fill" : "star")
                                        .resizable()
                                        .foregroundColor(.white)
                                        .bold()
                                        .frame(width: 27, height: 25)
                                        .onTapGesture
                                            {
                                                    star.toggle()
                                            }
                                    }
                                .frame(width: 70)
                                .offset(x: 110, y: -85)
                                Text("\"Engaging in open dialogue, research, and self-reflection allows us to continuously expand our knowledge and challenge preconceived notions.\"")
                                .foregroundColor(.white)
                                .font(.title3)
                                .bold()
                                .multilineTextAlignment(.center)
                                .frame(width: UIScreen.main.bounds.width - 120, height: 130)
                                
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
