//
//  ContentView.swift
//  Heartalk
//
//  Created by Stefano Giacobbe on 09/06/23.
//

import SwiftUI
import PencilKit

struct ContentView: View, KeyboardReadable {
    @State private var isActive = false
    @State private var canvasView = PKCanvasView()
    @State private var toolPicker = PKToolPicker()
    @State private var actualText = ""
    var body: some View {
        VStack {
            PencilButton(isActive: $isActive)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.horizontal)
            TextField("Ciao", text: $actualText)
                .onReceive(keyboardPublisher) { isKeyboardVisible in
                    if (isKeyboardVisible) {
                        isActive = false
                    }
                }
                .padding()
            Canvas(isActive: $isActive, canvasView: $canvasView, toolPicker: $toolPicker)
                .frame(width: 350, height: 600)
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        PencilButton(isActive: $isActive)
                    }
                }
        }
        .onAppear {
            scheduleNotifications()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
