//
//  MediafileProtocol.swift
//  IconMaker
//
//  Created by Alberto Almeida on 13/12/24.
//

protocol MediaFile: Identifiable, Hashable {
    associatedtype MediaType: Hashable
    
    var displayName: String { get }
    var mediaFile: MediaType { get }
}
