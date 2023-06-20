//
//  ContentView.swift
//  Heartalk
//
//  Created by Gregorio Guarino on 08/06/23.
//

import SwiftUI
struct ContentView: View
    {
        @State private var star = false
        let date = Date()
        @Environment(\.managedObjectContext) private var viewContext
        @FetchRequest(
        entity: Quote.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Quote.phrase, ascending: false)])
        var quotes: FetchedResults<Quote>
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
                                                                        RoundedRectangle(cornerRadius: 10)
                                                                        .fill(.pink)
                                                                        .frame(width: UIScreen.main.bounds.width - 60, height: 50)
                                                                        .shadow(color: .black.opacity(0.6), radius: 10)
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
                                                Text("My Reflections")
                                                .foregroundColor(.black)
                                                .font(.title2)
                                                .bold()
                                                .offset(x: -UIScreen.main.bounds.width / 4 + 15  )
                                                Spacer(minLength: 20)
                                                ForEach(quotes)
                                                    {
                                                        quote in ZStack
                                                            {
                                                                ZStack
                                                                    {
                                                                        RoundedRectangle(cornerRadius: 20)
                                                                        .stroke(.gray.opacity(0.15), lineWidth: 3)
                                                                        RoundedRectangle(cornerRadius: 20)
                                                                        .foregroundColor(.white)
                                                                    }
                                                                .frame(width: UIScreen.main.bounds.width - 60, height: 150)
                                                                VStack
                                                                    {
                                                                        Text(date.formatted(.dateTime.day().month().year()))
                                                                        .foregroundColor(.black)
                                                                        .bold()
                                                                        .offset(x: -UIScreen.main.bounds.width / 4)
                                                                        Text(quote.phrase ?? "")
                                                                        .foregroundColor(.black)
                                                                        .font(.title3)
                                                                        .multilineTextAlignment(.center)
                                                                        .frame(width: UIScreen.main.bounds.width - 90, height: 90)
                                                                    }
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
                                                .preferredColorScheme(.light)
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
        func deleteItems(offsets: IndexSet)
            {
                withAnimation
                    {
                        offsets.map
                            {
                                quotes[$0]
                            }
                        .forEach(viewContext.delete)
                        saveItems()
                    }
            }
        func saveItems()
            {
                do
                    {
                        try viewContext.save()
                    }
                catch
                    {
                        let nsError = error as NSError
                        fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
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

