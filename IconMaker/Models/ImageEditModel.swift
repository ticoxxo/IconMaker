//
//  PictureActionsModel.swift
//  IconMaker
//
//  Created by Alberto Almeida on 26/11/24.
//
import SwiftUI

extension  CropView  {

    
    
    @Observable
    class ViewModel: Hashable, Equatable {
      
        var currentZoom: CGFloat = 1.0
        var totalZoom: CGFloat = 1.0
        var orientation: Double = 0.0
        private var flipBool: Bool = false
        var flipValue: CGFloat {
            get {
                let val = (flipBool == false) ? 1.0 : -1.0
                return val
            }
        }
        
        func moveLeft() {
            orientation -= -90.0
        }
        
        func moveRight() {
            orientation += 90.0
        }
        
        func flipToggle() {
            flipBool.toggle()
        }
        
        func returnCroppedImage(image: Image) -> Image {
            return image
        }
        
        //Hashable functions
        func hash(into hasher: inout Hasher) {
            hasher.combine(currentZoom)
            hasher.combine(totalZoom)
            hasher.combine(orientation)
            hasher.combine(flipBool)
            hasher.combine(flipValue)
        }
        
        static func == (lhs: ViewModel, rhs: ViewModel) -> Bool {
            return lhs.currentZoom == rhs.currentZoom
            && lhs.totalZoom == rhs.totalZoom
            && lhs.orientation == rhs.orientation
            && lhs.flipBool == rhs.flipBool
            && lhs.flipValue == rhs.flipValue
            }

    }
}

