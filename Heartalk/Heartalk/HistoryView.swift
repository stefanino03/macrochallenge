//
//  HistoryView.swift
//  Heartalk
//
//  Created by Gregorio Guarino on 19/06/23.
//

import SwiftUI

struct HistoryView: View
    {
        @Environment(\.managedObjectContext) private var viewContext
        @FetchRequest(
        entity: Quote.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Quote.phrase, ascending: false)])
        var quotes: FetchedResults<Quote>
        var body: some View
            {
                List
                    {
                        ForEach(quotes)
                            {
                                quote in RoundedRectangle(cornerRadius: 20)
                                .stroke(lineWidth: 2)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .frame(width: 300, height: 120)
                                .overlay
                                    {
                                        Text(quote.phrase ?? "")
                                    }
                            }
                        .onDelete(perform: deleteItems)
                    }
                .listStyle(.plain)
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
