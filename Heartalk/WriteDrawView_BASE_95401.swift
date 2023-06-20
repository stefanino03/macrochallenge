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
        @Environment(\.dismiss) private var dismiss
        @State var isActive: Bool = false
        @State var picker: Bool = false
        @State var actualText = ""
        var body: some View
            {
                NavigationStack
                    {
                        VStack
                            {
                                ZStack
                                    {
                                        RoundedRectangle(cornerRadius: 7)
                                        .frame(width: UIScreen.main.bounds.width - 33, height: 33)
                                        .foregroundColor(.pink)
                                        .opacity(0.4)
                                        Text("Write")
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
                                    }
                                else
                                    {
                                        WriteView()
                                    }
                            }
                        .toolbar
                            {
                                ToolbarItemGroup(placement: .navigationBarTrailing)
                                    {
                                        Button
                                            {
                                                dismiss()
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

struct WriteDrawView_Previews: PreviewProvider
    {
        static var previews: some View
            {
                WriteDrawView()
            }
    }
