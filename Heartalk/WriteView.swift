//
//  WritingView.swift
//  Heartalk
//
//  Created by Stefano Giacobbe on 12/06/23.
//

import SwiftUI
import PencilKit

struct WriteView: View
    {
        @Environment(\.managedObjectContext) var viewContext
        @FetchRequest(entity: Quote.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Quote.phrase, ascending: true)])
        var items: FetchedResults<Quote>
        @Binding var actualText: String
        let textfieldphrase : String = " Write your reflection here..."
        var body: some View
            {
                TextField("", text: $actualText, axis: .vertical)
                .foregroundColor(.black)
                .accentColor(.pink)
                .placeholder(when: actualText.isEmpty)
                    {
                        Text("Write your reflection here...")
                        .foregroundColor(.gray)
                    }
                .frame(maxHeight: .infinity, alignment: .top)
                .padding([.horizontal, .top])
            }
        private func addItem()
            {
                withAnimation
                    {
                        let newQuote = Quote(context: viewContext)
                        newQuote.phrase = actualText
                        saveItems()
                        actualText = ""
                    }
            }
        private func deleteItems(offsets: IndexSet)
            {
                withAnimation
                    {
                        offsets.map { items[$0] }.forEach(viewContext.delete)
                        saveItems()
                    }
            }
        private func saveItems()
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
extension View
    {
        func placeholder <Content: View> (when shouldshow: Bool, alignment : Alignment = .leading, @ViewBuilder placeholder: () -> Content) -> some View
            {
                ZStack(alignment: alignment)
                    {
                        placeholder().opacity(shouldshow ? 1 : 0)
                        self
                    }
            }
    }

struct WriteView_Previews: PreviewProvider
    {
        static var previews: some View
            {
                WriteView(actualText: .constant(""))
            }
    }
