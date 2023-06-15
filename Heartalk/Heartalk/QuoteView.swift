//
//  QuoteView.swift
//  SessoTerzoTentativo
//
//  Created by Gregorio Guarino on 09/06/23.
//

import SwiftUI
struct QuoteView: View {
    @State private var star = false
    @Binding var isActive: Bool
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
                            QuoteBox(big: true)
                            HStack(spacing: 15) {
                                ZStack {
                                    StarButton(star: $star)
                                }
                                ShareButton()
                            }
                            .offset(y: 200)
                        }
                        Spacer(minLength: 40)
                        HStack {
                            Text("My reflection")
                                .foregroundColor(.white)
                                .bold()
                                .multilineTextAlignment(.leading)
                                .frame(width: 170)
                            Spacer()
                            NavigationLink {
                                WriteDrawView(isActive: $isActive)
                            } label: {
                                ZStack {
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

struct QuoteView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteView(isActive: .constant(false))
    }
}

