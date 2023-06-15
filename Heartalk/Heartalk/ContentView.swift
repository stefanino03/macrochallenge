//
//  ContentView.swift
//  SessoTerzoTentativo
//
//  Created by Gregorio Guarino on 08/06/23.
//

import SwiftUI
struct ContentView: View {
    @State private var star = false
    @State var isActive = false
    var body: some View {
        NavigationStack {
            ZStack {
                Image("sfondo")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    .ignoresSafeArea()
                ScrollView(showsIndicators: false) {
                    VStack {
                        Spacer(minLength: 70)
                        ZStack {
                            NavigationLink {
                                QuoteView(isActive: $isActive)
                            } label: {
                                ZStack {
                                    QuoteBox(big: false)
                                }
                            }
                            HStack(spacing: 15) {
                                ZStack {
                                    StarButton(star: $star)
                                }
                                ShareButton()
                            }
                            .offset(y: 125)
                        }
                        Spacer(minLength: 40)
                        HStack {
                            Text("My best quotes")
                                .foregroundColor(.white)
                                .bold()
                                .multilineTextAlignment(.leading)
                                .frame(width: 185)
                            Spacer()
                        }
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                Spacer(minLength: 30)
                                ForEach(0..<3) { i in
                                    WhiteButton()
                                }
                            }
                        }
                        HStack {
                            Text("My favourite reflections")
                                .foregroundColor(.white)
                                .bold()
                                .multilineTextAlignment(.leading)
                                .frame(width: 250, height: 30)
                            Spacer()
                        }
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                Spacer(minLength: 30)
                                ForEach(0..<5) { i in
                                    WhiteButton()
                                }
                            }
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    NavigationLink {
                        UnavailableView()
                    } label: {
                        Image(systemName: "calendar")
                            .foregroundColor(.white)
                    }
                }
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    NavigationLink {
                        UnavailableView()
                    } label: {
                        Image(systemName: "gear")
                            .foregroundColor(.white)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

