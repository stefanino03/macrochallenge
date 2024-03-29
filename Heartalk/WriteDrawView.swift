//
//  WriteDrawView.swift
//  Heartalk
//
//  Created by Gregorio Guarino on 08/06/23.
//
//
import SwiftUI
import PencilKit

struct WriteDrawView: View
    {
        @Environment(\.dismiss) private var dismiss
        @Environment(\.managedObjectContext) private var viewContext
        @FetchRequest(entity: Quote.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Quote.phrase, ascending: false)])
        var quotes: FetchedResults<Quote>
        @State var isActive: Bool = false
        @State var picker: Bool = false
        @State var actualText = ""
        var body: some View
            {
                NavigationStack
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
                                                Text("Write")
                                                .foregroundColor(.black)
                                                .font(.footnote)
                                                .offset(x: -(UIScreen.main.bounds.width / 4) + 8)
                                                .onTapGesture
                                                    {
                                                        withAnimation(Animation.easeOut(duration: 0.25))
                                                            {
                                                                picker.toggle()
                                                                isActive.toggle()
                                                            }
                                                    }
                                                Text("Draw")
                                                .foregroundColor(.black)
                                                .font(.footnote)
                                                .offset(x: (UIScreen.main.bounds.width / 4) - 8)
                                                .onTapGesture
                                                    {
                                                        withAnimation(Animation.easeOut(duration: 0.25))
                                                            {
                                                                picker.toggle()
                                                                isActive.toggle()
                                                            }
                                                    }
                                                ZStack
                                                    {
                                                        RoundedRectangle(cornerRadius: 7)
                                                        .frame(width: (UIScreen.main.bounds.width / 2) - 22, height: 28)
                                                        .foregroundColor(.pink)
                                                        .shadow(color: .pink, radius: 1)
                                                        Text(picker ? "Draw" : "Write")
                                                        .foregroundColor(.white)
                                                        .font(.footnote)
                                                        .bold()
                                                    }
                                                .offset(x : picker ? (UIScreen.main.bounds.width / 4) - 8 : -(UIScreen.main.bounds.width / 4) + 8)
                                            }
                                        if(picker == true)
                                            {
                                                DrawView(isActive: $isActive)
                                                .preferredColorScheme(.light)
                                            }
                                        else
                                            {
                                                WriteView(actualText: $actualText)
                                                .preferredColorScheme(.light)
                                            }
                                    }
                                .toolbar
                                    {
                                        ToolbarItemGroup(placement: .navigationBarTrailing)
                                            {
                                                Button
                                                    {
                                                        dismiss()
                                                        addItem()
                                                    }
                                                label:
                                                    {
                                                        HStack
                                                            {
                                                                Text("Done")
                                                                .foregroundColor(.pink)
                                                                .bold()
                                                            }
                                                    }
                                            }
                                        ToolbarItemGroup(placement: .navigationBarLeading)
                                            {
                                                Button
                                                    {
                                                        dismiss()
                                                    }
                                                label:
                                                    {
                                                        HStack
                                                            {
                                                                Text("Cancel")
                                                                .foregroundColor(.gray)
                                                                .navigationBarBackButtonHidden()
                                                            }
                                                    }
                                            }
                                    }
                            }
                    }
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
                        offsets.map { quotes[$0] }.forEach(viewContext.delete)
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

struct WriteDrawView_Previews: PreviewProvider
    {
        static var previews: some View
            {
                WriteDrawView()
            }
    }
