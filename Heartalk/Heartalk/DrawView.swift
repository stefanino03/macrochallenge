//
//  DrawingView.swift
//  Heartalk
//
//  Created by Stefano Giacobbe on 12/06/23.
//

import SwiftUI
import PencilKit

struct DrawView: View
{
    @Binding var isActive: Bool
    @State var canvasView = PKCanvasView()
    @State var toolPicker = PKToolPicker()
    @State var actualText = ""
    var body: some View
    {
        Canvas(isActive: $isActive, canvasView: $canvasView, toolPicker: $toolPicker)
            .frame(width: UIScreen.main.bounds.width)
    }
}

struct DrawingView_Previews: PreviewProvider
{
    static var previews: some View
    {
        DrawView(isActive: .constant(true))
    }
}
