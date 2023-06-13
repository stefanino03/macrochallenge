//
//  ActivityView.swift
//  Heartalk
//
//  Created by Stefano Giacobbe on 12/06/23.
//

import SwiftUI
import PencilKit

struct ActivityView: View {
    @State var isActive = false
    @State var canvasView = PKCanvasView()
    @State var toolPicker = PKToolPicker()
    @State var actualText = ""
    @State var selection: Int = 0
    var body: some View {
        NavigationStack {
            ZStack {
                Color.white.ignoresSafeArea()
                VStack {
                    Spacer()
                    HStack {
                        Button {
                            print("cancel")
                        } label: {
                            Text("Cancel")
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                        NavigationLink {
                            
                        } label: {
                            Text("Done")
                                .foregroundColor(.indigo)
                                .fontWeight(.bold)
                        }
                    }
                    .padding()
                    SegmentedPicker(isActive: $isActive, selection: $selection)
                        .onChange(of: selection) { newValue in
                            isActive.toggle()
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
