//
//  CropView.swift
//  IconMaker
// TODO: Make something with .interpolation(.none)
//  Created by Alberto Almeida on 07/11/24.
//

import SwiftUI



struct CropView: View {
    @Environment(\.coordinator) var coordinator: Coordinator
    var selectedImage: Image
    @State private var viewModel = ViewModel()
    
       var body: some View {
           VStack {
               ZStack {
                   // Main content
                   //Color.black.opacity(0.6)
                   selectedImage.resizable()
                       .blur(radius: 10)
                       .ignoresSafeArea()
                       .background()
                       .overlay(
                        selectedImage
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .rotationEffect(.degrees(viewModel.orientation))
                            .scaledToFit()
                            .scaleEffect(viewModel.currentZoom + viewModel.totalZoom)
                            .scaleEffect(x: viewModel.flipValue, y:1)
                            .frame(width: 200, height: 200)
                            .clipShape(Circle())
                            .gesture(
                                MagnifyGesture()
                                    .onChanged { value in
                                        viewModel.currentZoom = value.magnification - 1
                                    }
                                    .onEnded { value in
                                        viewModel.totalZoom += viewModel.currentZoom
                                        viewModel.currentZoom = 0
                                    }
                            )
                            
                       )
                       .transition(.opacity)
               }
               HStack {
                   
                   Button {
                       viewModel.moveLeft()
                   } label: {
                       Image(systemName: "arrow.left.square.fill")
                   }
                   
                   Button {
                       
                   } label: {
                       Image(systemName: "return")
                   }
                   
                   Button {
                       viewModel.moveRight()
                   } label: {
                       Image(systemName: "arrow.right.square.fill")
                   }
                   
                   Button {
                       viewModel.flipToggle()
                   } label: {
                       Image(systemName: "arrow.trianglehead.left.and.right.righttriangle.left.righttriangle.right.fill")
                   }
                   
                   Button {
                       //viewModel.returnCroppedImage(image: selectedImage)
                   } label: {
                       Text("Choose")
                           .foregroundStyle(Color.yellow)
                           .bold()
                   }
                   
               }
               .padding()
           }
       }
    
}


#Preview {
    
    CropView(selectedImage: Image("dany_the_warning"))
        .environment(\.coordinator, Coordinator())
}

/*
 
 .offset(x: dragOffset.width, y: dragOffset.height)
 .gesture(
     DragGesture()
         .onChanged { gesture in
             dragOffset = gesture.translation
         }
 )
 
 
 Rectangle()
     .frame(width: 200, height: 200)
     .opacity(0.1)
     .border(Color.gray, width: 4)
     .position(location)
 
 
 (.gray,
          in: Circle()
     .inset(by: 10)
     .stroke(lineWidth: 5)
          , fillStyle:
     )
 
 
 VStack {
     Image("dany_the_warning")
         .resizable()
         .aspectRatio(contentMode: .fit)
         .scaleEffect(currentZoom + totalZoom)
         .gesture(
                         MagnifyGesture()
                             .onChanged { value in
                                 currentZoom = value.magnification - 1
                             }
                             .onEnded { value in
                                 totalZoom += currentZoom
                                 currentZoom = 0
                             }
                     )
         .accessibilityZoomAction { action in
                         if action.direction == .zoomIn {
                             totalZoom += 1
                         } else {
                             totalZoom -= 1
                         }
                     }
         .overlay {
             Circle()
                 .inset(by: 10)
                 .stroke(lineWidth: 5)
                 
         }
         
     
 
 
 }
 */
