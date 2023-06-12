//
//  DrawingView.swift
//  Heartalk
//
//  Created by Stefano Giacobbe on 12/06/23.
//

import SwiftUI
import PencilKit

struct DrawingView: View {
    @State private var isActive = false
    @State private var canvasView = PKCanvasView()
    @State private var toolPicker = PKToolPicker()
    @State private var actualText = ""
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Canvas(isActive: $isActive, canvasView: $canvasView, toolPicker: $toolPicker)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.6)
            PencilButton(isActive: $isActive)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding()
                .foregroundColor(.teal)
        }
    }
}

struct DrawingView_Previews: PreviewProvider {
    static var previews: some View {
        DrawingView()
    }
}
