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
                                                Spacer(minLength: 20)
                                                QuoteBox()
                                                Spacer(minLength: 20)
                                                ZStack
                                                    {
                                                        NavigationLink
                                                            {
                                                                WriteDrawView()
                                                            }
                                                        label:
                                                            {
                                                                ZStack
                                                                    {
                                                                        ZStack
                                                                            {
                                                                                RoundedRectangle(cornerRadius: 10)
                                                                                .foregroundColor(.white)
                                                                                RoundedRectangle(cornerRadius: 10)
                                                                                    .stroke(lineWidth: 1.5)
                                                                                .fill(.pink)
                                                                            }
                                                                        .frame(width: UIScreen.main.bounds.width - 60, height: 50)
                                                                        Text("Make a reflection")
                                                                        .foregroundColor(.pink)
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
                                                        Text("My Reflections")
                                                        .foregroundColor(.black)
                                                        .font(.title2)
                                                        .bold()
                                                        .offset(x: -UIScreen.main.bounds.width / 4 + 15  )
                                                        Spacer(minLength: 20)
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
                                                HistoryView()
                                            }
                                        label:
                                            {
                                                Image(systemName: "list.bullet")
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

