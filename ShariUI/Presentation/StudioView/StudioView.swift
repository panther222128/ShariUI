//
//  StudioView.swift
//  ShariUI
//
//  Created by Jun Ho JANG on 6/4/24.
//

import SwiftUI

struct StudioView: View {
    
    @State private var cameraPreviewView: CameraPreviewView
    
    var body: some View {
        ZStack {
            cameraPreviewView
                .ignoresSafeArea()
        }
    }
    
}
