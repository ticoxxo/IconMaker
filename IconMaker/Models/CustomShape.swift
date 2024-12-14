//
//  CustomShape.swift
//  IconMaker
//
//  Created by Alberto Almeida on 13/11/24.
//

import SwiftUI
import UniformTypeIdentifiers

struct CuttableShape: Shape, Transferable {
    var width: CGFloat
    var height: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addRect(CGRect(x: 0, y: 0, width: width, height: height))
        path.closeSubpath()
        return path
    }
    
    static var transferRepresentation: some TransferRepresentation {
        CodableRepresentation(contentType: .cuttableShape)
    }
}

extension UTType {
    static var cuttableShape = UTType(exportedAs: "com.IconMaker.cuttableShape")
}



extension CuttableShape: Codable {
    enum CodingKeys: CodingKey {
        case width, height
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        width = try container.decode(CGFloat.self, forKey: .width)
        height = try container.decode(CGFloat.self, forKey: .height)
    }
    
    func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(width, forKey: .width)
            try container.encode(height, forKey: .height)
        }

}

