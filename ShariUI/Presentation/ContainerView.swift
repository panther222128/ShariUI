//
//  ContainerView.swift
//  ShariUI
//
//  Created by Horus on 5/30/24.
//

import SwiftUI

struct ContainerView: View {
    
    private let viewFlowCoordinator: ViewFlowCoordinator
    
    var body: some View {
        NavigationStack {
            TabView {
                viewFlowCoordinator.makeRestaurantListView()
                    .tabItem {
                        Label("오마카세", systemImage: "list.bullet")
                    }
                
                viewFlowCoordinator.makeGlossaryView()
                    .tabItem {
                        Label("용어사전", systemImage: "book.closed")
                    }
                
                viewFlowCoordinator.makeSettingsView()
                    .tabItem {
                        Label("설정", systemImage: "gear")
                    }
            }
        }
    }
    
    init(viewFlowCoordinator: ViewFlowCoordinator) {
        self.viewFlowCoordinator = viewFlowCoordinator
    }
    
}

#Preview {
    Text("")
}
