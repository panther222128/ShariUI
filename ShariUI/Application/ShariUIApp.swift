//
//  ShariUIApp.swift
//  ShariUI
//
//  Created by Horus on 5/30/24.
//

import SwiftUI

@main
struct ShariUIApp: App {
    private let appFlowCoordinator: AppFlowCoordinator = {
        let appDIContainer = AppDIContainer()
        let appFlowCoordinator = AppFlowCoordinator(appDIContainer: appDIContainer)
        return appFlowCoordinator
    }()
    
    var body: some Scene {
        WindowGroup {
            appFlowCoordinator.start()
        }
    }
}
