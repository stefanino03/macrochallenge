////
////  WriteDrawView.swift
////  SessoTerzoTentativo
////
////  Created by Gregorio Guarino on 08/06/23.
////
//
import SwiftUI
import PencilKit

struct WriteDrawView: View
    {
        @State var isActive = false
        @State var canvasView = PKCanvasView()
        @State var toolPicker = PKToolPicker()
        @State var actualText = ""
        @State var selection: Int = 0
        var body: some View
            {
                NavigationStack
                    {
                        VStack
                            {
                                SegmentedPicker(isActive: $isActive, selection: $selection)
                                .onChange(of: selection)
                                    {
                                        newValue in isActive.toggle()
                                    }
                            }
                        .toolbar
                            {
                                ToolbarItemGroup(placement: .navigationBarTrailing)
                                    {
                                        NavigationLink("Done", destination: UnavailableView())
                                        .foregroundColor(.blue)
                                    }
                            }
                    }
                .onAppear
                    {
                        scheduleNotifications()
                    }
            }
    }

struct WriteDrawView_Previews: PreviewProvider {
    static var previews: some View {
        WriteDrawView()
    }
}
