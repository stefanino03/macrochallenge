//
//  ActivityView.swift
//  Heartalk
//
//  Created by Stefano Giacobbe on 12/06/23.
//

import SwiftUI
import PencilKit

struct ActivityView: View {
    @State private var isActive = false
    @State private var canvasView = PKCanvasView()
    @State private var toolPicker = PKToolPicker()
    @State private var actualText = ""
    @State var selection: Int = 0
    var body: some View {
        ZStack {
            Color.teal.ignoresSafeArea()
            VStack(spacing: 50) {
                SegmentedPicker(selection: $selection)
                Button {
                    print("ok")
                } label: {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: UIScreen.main.bounds.width * 0.9, height: 70)
                        .overlay {
                            Text("Done")
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }
                }

            }
        }
        .onAppear {
            scheduleNotifications()
        }
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView()
    }
}
