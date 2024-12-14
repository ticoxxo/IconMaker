//
//  CoordinatorView.swift
//  IconMaker
//
//  Created by Alberto Almeida on 11/12/24.
//

import SwiftUI

struct CoordinatorView: View {
    @State private var coordinator = Coordinator()
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(page: .home)
                .navigationDestination(for: AppPage.self) { page in
                    coordinator.build(page: page)
                }
        }
        .environment(\.coordinator, coordinator)
    }
}

#Preview {
    CoordinatorView()
        .environment(\.coordinator, Coordinator())
}
