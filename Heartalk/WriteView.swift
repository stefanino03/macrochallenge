//
//  WritingView.swift
//  Heartalk
//
//  Created by Stefano Giacobbe on 12/06/23.
//

import SwiftUI
import PencilKit

struct WriteView: View {
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(entity: Quote.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Quote.phrase, ascending: true)])
    var items: FetchedResults<Quote>
    @Binding var actualText: String
    var body: some View {
        TextField("Write your thoughts here...", text: $actualText, axis: .vertical)
            .frame(maxHeight: .infinity, alignment: .top)
            .padding([.horizontal, .top])
//            .toolbar
//        {
//            ToolbarItemGroup(placement: .navigationBarTrailing)
//            {
//                Button
//                {
//                    addItem()
//                }
//            label:
//                {
//                    HStack
//                    {
//                        Text("Done")
//                            .foregroundColor(.pink)
//                            .bold()
//                    }
//                }
//            }
//        }
    }
    private func addItem() {
        withAnimation {
            let newQuote = Quote(context: viewContext)
            newQuote.phrase = actualText
            saveItems()
            actualText = ""
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)
            saveItems()
        }
    }

    private func saveItems() {
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
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
