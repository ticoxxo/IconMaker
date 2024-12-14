//
//  IconMaker.swift
//  IconMaker
//
//  Created by Alberto Almeida on 06/11/24.
//
import SwiftUI
import PhotosUI
import CoreTransferable

class IconMakerModel: ObservableObject {
    @Published var text: String = "yeah"
    
    enum TransferError: Error {
        case importFailed
    }
    
    enum IconState {
        case empty
        case loading(Progress)
        case success(Image)
        case failure(Error)
    }
    
    @Published var iconState: IconState = .empty
    @Published var imageSelection: PhotosPickerItem? = nil {
        didSet {
            if let imageSelection {
                let progress = loadTransferable(from: imageSelection)
                iconState = .loading(progress)
            } else {
                iconState = .empty
            }
        }
    }
    
    struct ProfileImage: Transferable {
        let image: Image
        
        static var transferRepresentation: some TransferRepresentation {
            DataRepresentation(importedContentType: .image) { data in
            #if canImport(AppKit)
                guard let nsImage = NSImage(data: data) else {
                    throw TransferError.importFailed
                }
                let image = Image(nsImage: nsImage)
                return ProfileImage(image: image)
            #elseif canImport(UIKit)
                guard let uiImage = UIImage(data: data) else {
                    throw TransferError.importFailed
                }
                let image = Image(uiImage: uiImage)
                return ProfileImage(image: image)
            #else
                throw TransferError.importFailed
            #endif
            }
        }
    }
    
    private func loadTransferable(from imageSelection: PhotosPickerItem) -> Progress {
        return imageSelection.loadTransferable(type: ProfileImage.self) { result in
            DispatchQueue.main.async {
                guard imageSelection == self.imageSelection else {
                    print("Failed to get the selected item.")
                    return
                }
                switch result {
                case .success(let profileImage?):
                    self.iconState = .success(profileImage.image)
                case .success(nil):
                    self.iconState = .empty
                case .failure(let error):
                    self.iconState = .failure(error)
                }
            }
        }
    }
    
    
    
}
