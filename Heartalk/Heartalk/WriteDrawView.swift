////
////  WriteDrawView.swift
////  SessoTerzoTentativo
////
////  Created by Gregorio Guarino on 08/06/23.
////
//
import SwiftUI
import PencilKit

struct WriteDrawView: View {
    @Binding var isActive: Bool
    @State var canvasView = PKCanvasView()
    @State var toolPicker = PKToolPicker()
    @State var actualText = ""
    @Binding var selection: Int
    var body: some View {
        NavigationStack {
            VStack {
                SegmentedPicker(isActive: $isActive, selection: $selection)
                    .onChange(of: selection) {newValue in
                        if selection == 0 {
                            isActive = false
                        } else if selection == 1 {
                            isActive = true
                        }
                        print(isActive)
                    }
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    NavigationLink("Done", destination: UnavailableView())
                        .foregroundColor(.blue)
                }
            }
        }
        .onAppear {
            scheduleNotifications()
        }
    }
}

struct WriteDrawView_Previews: PreviewProvider {
    static var previews: some View {
        WriteDrawView(isActive: .constant(false), selection: .constant(0))
    }
}
