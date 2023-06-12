//
//  ContentView.swift
//  Heartalk
//
//  Created by Stefano Giacobbe on 09/06/23.
//

import SwiftUI
import PencilKit

struct ContentView: View, KeyboardReadable {
    var body: some View {
        ActivityView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
