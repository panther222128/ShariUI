//
//  StudioView.swift
//  ShariUI
//
//  Created by Jun Ho JANG on 6/4/24.
//

import SwiftUI
import AVFoundation

struct StudioView: View {
    
    @State var cameraPreviewView: CameraPreviewView
    
    var body: some View {
        ZStack {
            cameraPreviewView
                .ignoresSafeArea()
        }
    }
    
    init() {
        self.cameraPreviewView = CameraPreviewView(session: AVCaptureSession())
    }
    
}
