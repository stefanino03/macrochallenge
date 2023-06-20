//
//  UnavailableView.swift
//  Heartalk
//
//  Created by Gregorio Guarino on 08/06/23.
//

import SwiftUI

struct UnavailableView: View
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
                .navigationBarTitle("Settings")
            }
    }

struct UnavailableView_Previews: PreviewProvider
    {
        static var previews: some View
            {
                UnavailableView()
            }
    }
