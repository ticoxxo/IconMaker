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
        Button {
            navigation.push(page: .AddReminder)
        } label: {
            Text("Vamos a reminder")
        }
    }
}

#Preview {
    @Previewable @State var coordinator = Coordinator()
    NavigationStack(path: $coordinator.path) {
        coordinator.build(page: .home)
            .navigationDestination(for: AppPage.self) { page in
                coordinator.build(page: page)
            }
    }
    .environment(\.coordinator, coordinator)
}
