////
////  WriteDrawView.swift
////  SessoTerzoTentativo
////
////  Created by Gregorio Guarino on 08/06/23.
////
//
import SwiftUI
import PencilKit
//
//struct WriteDrawView: View
//    {
//    @State var mammt: Bool = false
//        @State private var selectedTab: Int = 0
//        var body: some View
//            {
//                NavigationStack
//                    {
//                        ZStack
//                            {
//                                VStack
//                                    {
//                                        Picker("", selection: $selectedTab)
//                                            {
//                                                Text("Write")
//                                                .foregroundColor(.blue)
//                                                .tag(0)
//                                                Text("Draw").tag(1)
//                                            }
//                                        .pickerStyle(.segmented)
//                                        .frame(width: 360)
//                                        switch(selectedTab)
//                                            {
//                                                case 0: WriteView(mammt: $mammt)
//                                                default: DrawView()
//                                            }
//                                        Spacer()
//                                        /*HStack
//                                            {
//                                                Spacer()
//                                                ZStack
//                                                    {
//                                                        RoundedRectangle(cornerRadius: 10)
//                                                        .frame(width: 150, height: 50)
//                                                        .foregroundColor(.accentColor)
//                                                        NavigationLink(destination: UnavailableView())
//                                                            {
//                                                                Text("Submit")
//                                                                .frame(width: 100, height: 50)
//                                                            }
//                                                        .foregroundColor(.white)
//                                                    }
//                                                Spacer()
//                                                ZStack
//                                                    {
//                                                        RoundedRectangle(cornerRadius: 10)
//                                                        .stroke(.blue, lineWidth: 4)
//                                                        .frame(width: 150, height: 50)
//                                                        .background(.white)
//                                                        .cornerRadius(10)
//                                                        NavigationLink(destination: UnavailableView())
//                                                            {
//                                                                Text("Share")
//                                                                .frame(width: 100, height: 50)
//
//                                                            }
//
//                                                        .foregroundColor(.accentColor)
//                                                    }
//                                                Spacer()
//                                            }*/
//                                    }
//                            }
//                        .toolbar
//                            {
//                                ToolbarItemGroup(placement: .navigationBarTrailing)
//                                    {
//                                        NavigationLink("Done", destination: UnavailableView())
//                                    }
//                            }
//                    }
//            }
//    }
//
//struct WriteDrawView_Previews: PreviewProvider
//    {
//        static var previews: some View
//            {
//                WriteDrawView()
//            }
//    }

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
