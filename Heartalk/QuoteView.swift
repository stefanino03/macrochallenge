//
//  QuoteView.swift
//  SessoTerzoTentativo
//
//  Created by Gregorio Guarino on 09/06/23.
//

import SwiftUI
struct QuoteView: View
    {
        var body: some View
            {
                ZStack
                    {
                        Image("sfondo")
                        .resizable()
                        .ignoresSafeArea()
                        VStack
                            {
                                Image(systemName:"wrongwaysign.fill")
                                .resizable()
                                .foregroundColor(.red)
                                .frame(width: 50, height: 50)
                                Text("Unavailable View")
                                .font(.title)
                                .foregroundColor(.black)
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

