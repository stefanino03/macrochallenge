//
//  HistoryView.swift
//  Heartalk
//
//  Created by Gregorio Guarino on 19/06/23.
//

import SwiftUI

struct HistoryView: View
    {
        let date = Date()
        @State var picker: Bool = false
        @Environment(\.managedObjectContext) private var viewContext
        @FetchRequest(
        entity: Quote.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Quote.phrase, ascending: false)])
        var quotes: FetchedResults<Quote>
        var body: some View
            {
                ZStack
                    {
                        Image("bianco")
                        .resizable()
                        .ignoresSafeArea()
                        VStack
                            {
                                ZStack
                                    {
                                        RoundedRectangle(cornerRadius: 7)
                                        .frame(width: UIScreen.main.bounds.width - 33, height: 33)
                                        .foregroundColor(.gray)
                                        .opacity(0.15)
                                        Text("All")
                                        .foregroundColor(.black)
                                        .font(.footnote)
                                        .offset(x: -(UIScreen.main.bounds.width / 4) + 8)
                                        .onTapGesture
                                            {
                                                withAnimation(Animation.easeOut(duration: 0.25))
                                                    {
                                                        picker.toggle()
                                                    }
                                            }
                                        Text("Favourites")
                                        .foregroundColor(.black)
                                        .font(.footnote)
                                        .offset(x: (UIScreen.main.bounds.width / 4) - 8)
                                        .onTapGesture
                                            {
                                                withAnimation(Animation.easeOut(duration: 0.25))
                                                    {
                                                        picker.toggle()
                                                    }
                                            }
                                        ZStack
                                            {
                                                RoundedRectangle(cornerRadius: 7)
                                                .frame(width: (UIScreen.main.bounds.width / 2) - 22, height: 28)
                                                .foregroundColor(.pink)
                                                .shadow(color: .pink, radius: 1)
                                                Text(picker ? "Favourites" : "All")
                                                .foregroundColor(.white)
                                                .font(.footnote)
                                                .bold()
                                            }
                                        .offset(x : picker ? (UIScreen.main.bounds.width / 4) - 8 : -(UIScreen.main.bounds.width / 4) + 8)
                                    }
                                List
                                    {
                                        ForEach(quotes)
                                            {
                                                quote in ZStack
                                                    {
                                                        ZStack
                                                            {
                                                                RoundedRectangle(cornerRadius: 20)
                                                                .stroke(.gray.opacity(0.15), lineWidth: 4)
                                                                RoundedRectangle(cornerRadius: 20)
                                                                .foregroundColor(.white)
                                                                .shadow(color: .black.opacity(0.6), radius: 5)
                                                            }
                                                        .frame(width: UIScreen.main.bounds.width - 60, height: 150)
                                                        .offset(x: UIScreen.main.bounds.width / 32)
                                                        VStack
                                                            {
                                                                Text(date.formatted(.dateTime.day().month().year()))
                                                                .foregroundColor(.black)
                                                                .bold()
                                                                .offset(x: (-UIScreen.main.bounds.width / 4) + 15)
                                                                Text(quote.phrase ?? "")
                                                                .foregroundColor(.black)
                                                                .font(.title3)
                                                                .multilineTextAlignment(.center)
                                                                .frame(width: UIScreen.main.bounds.width - 90, height: 90)
                                                                .offset(x: (-UIScreen.main.bounds.width / 16) + 40)
                                                            }
                                                    }
                                            }
                                        .onDelete(perform: deleteItems)
                                    }
                                .listStyle(.plain)
                            }
                            .navigationBarTitle("Diary")
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

struct HistoryView_Previews: PreviewProvider
    {
        static var previews: some View
            {
                HistoryView()
            }
    }
