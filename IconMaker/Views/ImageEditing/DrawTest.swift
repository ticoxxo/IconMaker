//
//  DrawTest.swift
//  IconMaker
//  DO NOT USE THIS VIEW
//  Created by Alberto Almeida on 18/11/24.
//

import SwiftUI

struct DrawTest: View {
    @State private var droppedImage: Image? = nil
        @State private var isTargeted = false
    @State private var wawas = Image("wawas")
        
        var body: some View {
            VStack {
                wawas
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .draggable(wawas)
                Text("Arrastra una imagen aquí")
                    .padding()
                    .background(isTargeted ? Color.green.opacity(0.3) : Color.gray.opacity(0.3))
                    .cornerRadius(10)
                    .onDrop(of: ["public.image"], isTargeted: $isTargeted, perform: handleDrop)
                
                if let image = droppedImage {
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .border(Color.black, width: 1)
                } else {
                    Text("No se ha soltado ninguna imagen")
                        .foregroundColor(.gray)
                        .frame(width: 200, height: 200)
                        .border(Color.black, width: 1)
                }
            }
            .padding()
        }
        
        private func handleDrop(providers: [NSItemProvider]) -> Bool {
            for provider in providers {
                if provider.hasItemConformingToTypeIdentifier("public.image") {
                    provider.loadItem(forTypeIdentifier: "public.image", options: nil) { (item, error) in
                        DispatchQueue.main.async {
                            if let data = item as? Data, let uiImage = UIImage(data: data) {
                                self.droppedImage = Image(uiImage: uiImage)
                            } else if let url = item as? URL, let uiImage = UIImage(contentsOfFile: url.path) {
                                self.droppedImage = Image(uiImage: uiImage)
                            }
                        }
                    }
                    return true
                }
            }
            return false
        }

}

#Preview {
    DrawTest()
}
