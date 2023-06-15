//
//  Canvas.swift
//  Heartalk
//
//  Created by Stefano Giacobbe on 09/06/23.
//

import Foundation
import PencilKit
import SwiftUI

struct Canvas: UIViewRepresentable {
    @Binding var isActive: Bool
    @Binding var canvasView: PKCanvasView
    @Binding var toolPicker: PKToolPicker
    func makeUIView(context: Context) -> PKCanvasView {
        canvasView.drawingPolicy = .anyInput
        canvasView.tool = PKInkingTool(.pen, color: .black, width: 1)
        return canvasView
    }
    func updateUIView(_ canvasView: PKCanvasView, context: Context) {
        toolPicker.addObserver(canvasView)
        toolPicker.setVisible(isActive, forFirstResponder: canvasView)
        DispatchQueue.main.async {
            canvasView.becomeFirstResponder()
        }
    }
}

