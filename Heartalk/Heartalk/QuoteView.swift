//
//  QuoteView.swift
//  SessoTerzoTentativo
//
//  Created by Gregorio Guarino on 09/06/23.
//

import SwiftUI
struct QuoteView: View
{
    @State private var star = false
    var body: some View
    {
        NavigationStack
        {
            ZStack
            {
                Image("sfondo")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    .ignoresSafeArea()
                ScrollView(showsIndicators: false)
                {
                    VStack
                    {
                        Rectangle()
                            .frame(width: 1, height: 60)
                            .opacity(0.001)
                        ZStack
                        {
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(.gray)
                                .opacity(0.25)
                                .frame(width: UIScreen.main.bounds.width - 60, height: 400)
                            VStack
                            {
                                Text("\"Viva la figa\"")
                                    .foregroundColor(.white)
                                    .font(.title)
                                    .multilineTextAlignment(.center)
                                Text("- Mahatma Gandhi")
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.trailing)
                            }
                            HStack
                            {
                                ZStack
                                {
                                    Image(systemName: "star.fill")
                                        .resizable()
                                        .frame(width: 40, height: 40)
                                        .opacity(star ? 1 : 0)
                                        .foregroundColor(.yellow)
                                    
                                    Button
                                    {
                                        star.toggle()
                                    }
                                label:
                                    {
                                        Image(systemName: "star.circle.fill")
                                            .resizable()
                                            .frame(width: 50, height: 50)
                                            .foregroundColor(.white)
                                    }
                                }
                                Text("  ")
                                ShareLink(item: "Share quote")
                                {
                                    Image(systemName: "square.and.arrow.up.circle.fill")
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                        .foregroundColor(.white)
                                }
                            }
                            .offset(y: 200)
                        }
                        Spacer(minLength: 40)
                        HStack
                        {
                            Text("My reflection")
                                .foregroundColor(.white)
                                .bold()
                                .multilineTextAlignment(.leading)
                                .frame(width: 170)
                            Spacer()
                            NavigationLink
                            {
                                WriteDrawView()
                            }
                        label:
                            {
                                ZStack
                                {
                                    Circle()
                                        .strokeBorder(lineWidth: 2)
                                        .frame(width: 26, height: 26)
                                        .foregroundColor(.white)
                                    Image(systemName: "plus")
                                        .foregroundColor(.white)
                                }
                                .frame(width: 80)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct QuoteView_Previews: PreviewProvider
{
    static var previews: some View
    {
        QuoteView()
    }
}

