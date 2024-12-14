//
//  IconCircurlarShape.swift
//  IconMaker
//
//  Created by Alberto Almeida on 06/11/24.
//

import SwiftUI

struct IconCircurlarShape: View {
    @ObservedObject var model: IconMakerModel
    var body: some View {
        ImageState(iconState: model.iconState)
            .scaledToFit()
            
            
    }
}

struct ImageState: View {
    @Environment(\.coordinator) var navigation: Coordinator
    let iconState: IconMakerModel.IconState
    
    var body: some View {
        
        switch iconState {
        case .empty:
            Image(systemName: "person.circle.fill")
        case .loading(let progress):
            ProgressView()
        case .success(let image):
            
            ProgressView()
                .onAppear() {
                    navigation.push(page: .CropImage(value: image))
                }
           
        case .failure:
            Image(systemName: "exclamationmark.triangle.fill")
                .font(.system(size: 40))
                .foregroundColor(.white)
        }
    }
}

#Preview {
    @Previewable @StateObject var model = IconMakerModel()
    return IconCircurlarShape(model: model)
        .environment(\.coordinator, Coordinator())
}
