//
//  ContentView.swift
//  SessoTerzoTentativo
//
//  Created by Gregorio Guarino on 08/06/23.
//

import SwiftUI
struct ContentView: View
    {
        @State private var star = false
        @State var selection: Int = 0
        @State var isActive = false
        var body: some View
            {
                NavigationStack
                    {
                        ZStack
                            {
                                Image("sfondo")
                                .resizable()
                                .ignoresSafeArea()
                                ScrollView(showsIndicators: false)
                                    {
                                        VStack
                                            {
                                                Spacer(minLength: 10)
                                                QuoteBox()
                                                Spacer(minLength: 30)
                                                ZStack
                                                    {
                                                        NavigationLink
                                                            {
                                                                WriteDrawView(isActive: $isActive, selection: $selection)
                                                            }
                                                        label:
                                                            {
                                                                ZStack
                                                                    {
                                                                        RoundedRectangle(cornerRadius: 10)
                                                                        .frame(width: UIScreen.main.bounds.width - 60, height: 50)
                                                                        .foregroundColor(.pink)
                                                                        Text("Make a reflection")
                                                                        .foregroundColor(.white)
                                                                        .bold()
                                                                    }
                                                            }
                                                    }
                                                HStack
                                                    {
                                                        Spacer()
                                                    }
                                                VStack
                                                    {
                                                        Spacer(minLength: 30)
                                                        ForEach(0..<3)
                                                            {
                                                                i in Reflection()
                                                                Spacer(minLength: 20)
                                                            }
                                                    }
                                            }
                                    }
                            }
                        .toolbar
                            {
                                ToolbarItemGroup(placement: .navigationBarTrailing)
                                    {
                                        NavigationLink
                                            {
                                                QuoteView()
                                            }
                                        label:
                                            {
                                                Image(systemName: "calendar")
                                                .foregroundColor(.pink)
                                            }
                                    }
                                ToolbarItemGroup(placement: .navigationBarLeading)
                                    {
                                        NavigationLink
                                            {
                                                UnavailableView()
                                            }
                                        label:
                                            {
                                                Image(systemName: "gear")
                                                .foregroundColor(.pink)
                                            }
                                    }
                            }
                    }
                .onChange(of: selection)
                    {
                        newValue in if selection == 0
                            {
                                isActive = false
                            }
                        else if selection == 1
                            {
                                isActive = true
                            }
                        print(isActive)
                    }
                .onAppear
                    {
                        scheduleNotifications()
                    }
            }
    }

struct ContentView_Previews: PreviewProvider
    {
        static var previews: some View
            {
                ContentView()
            }
    }

