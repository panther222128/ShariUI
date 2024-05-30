//
//  AppFlowCoordinator.swift
//  ShariUI
//
//  Created by Horus on 5/30/24.
//

import Foundation

final class AppFlowCoordinator {
    
    private let appDIContainer: AppDIContainer
    
    init(appDIContainer: AppDIContainer) {
        self.appDIContainer = appDIContainer
    }
    
    func start() -> ContainerView {
        let sceneDIContainer = appDIContainer.makeSceneDIContainer()
        let flow = sceneDIContainer.makeViewFlowCoordinator()
        return flow.start()
    }
    
}
