//
//  UnavailableView.swift
//  SessoTerzoTentativo
//
//  Created by Gregorio Guarino on 08/06/23.
//

import SwiftUI

struct UnavailableView: View
{
    var body: some View
    {
        VStack
        {
            Image(systemName:"wrongwaysign.fill")
                .resizable()
                .frame(width: 50, height: 50)
            Text("Unavailable View")
                .font(.title)
        }
    }
}

struct UnavailableView_Previews: PreviewProvider
{
    static var previews: some View
    {
        UnavailableView()
    }
}
