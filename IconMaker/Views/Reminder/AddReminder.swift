//
//  Home.swift
//  IconMaker
//
//  Created by Alberto Almeida on 07/11/24.
//

import SwiftUI
import PhotosUI

struct AddReminder: View {
    @Environment(\.coordinator) var navigation
    @StateObject var viewModel = IconMakerModel()
    @State private var show: Bool = false
    var body: some View {
        VStack {
            /*
             IconCircurlarShape(model: viewModel)
                 .overlay(alignment: .bottomTrailing) {
                     PhotosPicker(selection: $viewModel.imageSelection,
                                  matching: .images,
                                  photoLibrary: .shared()) {
                         Image(systemName: "pencil.circle.fill")
                             .symbolRenderingMode(.multicolor)
                             .font(.system(size: 30))
                             .foregroundColor(.accentColor)
                     }
                 }
             */
            PhotosPicker(selection: $viewModel.imageSelection,
                         matching: .images,
                         photoLibrary: .shared()) {
                if !show {
                    Image(systemName: "pencil.circle.fill")
                        .symbolRenderingMode(.multicolor)
                        .font(.system(size: 30))
                        .foregroundColor(.accentColor)
                } else {
                    ImageState(iconState: viewModel.iconState)
                        .scaledToFit()
                    
                }
                
                
            }
        }
        .onChange(of: viewModel.imageSelection) {
            //navigation.push(page: .CropImage(value: ))
            show.toggle()
                
        }
        .padding()
    }
}

#Preview {
    AddReminder()
        .environment(\.coordinator, Coordinator())
}
