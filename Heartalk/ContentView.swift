//
//  ContentView.swift
//  SessoTerzoTentativo
//
//  Created by Gregorio Guarino on 08/06/23.
//

import SwiftUI
struct ContentView: View
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
                                                        NavigationLink
                                                            {
                                                                QuoteView()
                                                            }
                                                        label:
                                                            {
                                                                ZStack
                                                                    {
                                                                        RoundedRectangle(cornerRadius: 20)
                                                                        .foregroundColor(.gray)
                                                                        .opacity(0.25)
                                                                        .frame(width: UIScreen.main.bounds.width - 60, height: 250)
                                                                        Text("\"Love is like a plant, the more you feed it, the more it grows.\"")
                                                                        .foregroundColor(.white)
                                                                        .font(.title)
                                                                        .multilineTextAlignment(.center)
                                                                        .frame(width: UIScreen.main.bounds.width - 130)
                                                                    }
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
                                                        .offset(y: 125)
                                                    }
                                                Spacer(minLength: 40)
                                                HStack
                                                    {
                                                        Text("My best quotes")
                                                        .foregroundColor(.white)
                                                        .bold()
                                                        .multilineTextAlignment(.leading)
                                                        .frame(width: 185)
                                                        Spacer()
                                                    }
                                                ScrollView(.horizontal, showsIndicators: false)
                                                    {
                                                        HStack
                                                            {
                                                                Spacer(minLength: 30)
                                                                ZStack
                                                                    {
                                                                        RoundedRectangle(cornerRadius: 20)
                                                                        .foregroundColor(.white)
                                                                        .opacity(0.8)
                                                                        .frame(width: 200, height: 150)
                                                                        Text("\"Love is like a plant, the more you feed it, the more it grows.\"")
                                                                        .font(.title3)
                                                                        .multilineTextAlignment(.center)
                                                                        .frame(width: 200, height: 150)
                                                                    }
                                                                ZStack
                                                                    {
                                                                        RoundedRectangle(cornerRadius: 20)
                                                                        .foregroundColor(.white)
                                                                        .opacity(0.8)
                                                                        .frame(width: 200, height: 150)
                                                                        Text("\"Love is like a plant, the more you feed it, the more it grows.\"")
                                                                        .font(.title3)
                                                                        .multilineTextAlignment(.center)
                                                                        .frame(width: 200, height: 150)
                                                                    }
                                                            }
                                                    }
                                                HStack
                                                    {
                                                        Text("My favourite reflections")
                                                        .foregroundColor(.white)
                                                        .bold()
                                                        .multilineTextAlignment(.leading)
                                                        .frame(width: 250, height: 30)
                                                        Spacer()
                                                    }
                                                ScrollView(.horizontal, showsIndicators: false)
                                                    {
                                                        HStack
                                                            {
                                                                Spacer(minLength: 30)
                                                                ZStack
                                                                    {
                                                                        RoundedRectangle(cornerRadius: 20)
                                                                        .foregroundColor(.white)
                                                                        .opacity(0.8)
                                                                        .frame(width: 200, height: 150)
                                                                        Text("\"Love is like a plant, the more you feed it, the more it grows.\"")
                                                                        .font(.title3)
                                                                        .multilineTextAlignment(.center)
                                                                        .frame(width: 200, height: 150)
                                                                    }
                                                                ZStack
                                                                    {
                                                                        RoundedRectangle(cornerRadius: 20)
                                                                        .foregroundColor(.white)
                                                                        .opacity(0.8)
                                                                        .frame(width: 200, height: 150)
                                                                        Text("\"Love is like a plant, the more you feed it, the more it grows.\"")
                                                                        .font(.title3)
                                                                        .multilineTextAlignment(.center)
                                                                        .frame(width: 200, height: 150)
                                                                    }
                                                            }
                                                    }
                                            }
                                    }
                            }
                        .toolbar
                            {
                                ToolbarItemGroup(placement: .navigationBarTrailing)
                                    {
                                        NavigationLink
                                            {
                                                UnavailableView()
                                            }
                                        label:
                                            {
                                                Image(systemName: "calendar")
                                                .foregroundColor(.white)
                                            }
                                    }
                                ToolbarItemGroup(placement: .navigationBarLeading)
                                    {
                                        NavigationLink
                                            {
                                                UnavailableView()
                                            }
                                        label:
                                            {
                                                Image(systemName: "gear")
                                                .foregroundColor(.white)
                                            }
                                    }
                            }
                    }
            }
    }

struct ContentView_Previews: PreviewProvider
    {
        static var previews: some View
            {
                ContentView()
            }
    }

