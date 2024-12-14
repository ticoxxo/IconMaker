//
//  Home.swift
//  IconMaker
//
//  Created by Alberto Almeida on 25/11/24.
//

import SwiftUI

struct Home: View {
    @Environment(\.coordinator) var navigation: Coordinator
    var body: some View {
        //@Bindable var nav = navigation
        Button {
            navigation.push(page: .AddReminder)
        } label: {
            Text("Vamos a reminder")
        }
    }
}

#Preview {
    Home()
        .environment(\.coordinator, Coordinator())
}
