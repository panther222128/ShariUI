//
//  AppDIContainer.swift
//  ShariUI
//
//  Created by Horus on 5/30/24.
//

import Foundation

final class AppDIContainer {
    
    lazy var appConfiguration = AppConfiguration()
    
    lazy var fileGenerator: FileGenerator = {
        let fileGenerator: FileGenerator = DefaultFileGenerator()
        return fileGenerator
    }()
    
    func makeSceneDIContainer() -> SceneDIContainer {
        let dependencies = SceneDIContainer.Dependencies(fileGenerator: fileGenerator)
        return SceneDIContainer(dependencies: dependencies)
    }
    
}
