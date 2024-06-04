//
//  PreviewView.swift
//  ShariUI
//
//  Created by Jun Ho JANG on 6/4/24.
//

import UIKit
import SwiftUI
import AVFoundation

final class PreviewView: UIView {
    
    var videoPreviewLayer: AVCaptureVideoPreviewLayer {
        guard let layer = layer as? AVCaptureVideoPreviewLayer else {
            fatalError("Expected `AVCaptureVideoPreviewLayer` type for layer. Check PreviewView.layerClass implementation.")
        }
        return layer
    }
    
    var session: AVCaptureSession? {
        get {
            return videoPreviewLayer.session
        }
        set {
            videoPreviewLayer.session = newValue
        }
    }
    
    override class var layerClass: AnyClass {
        return AVCaptureVideoPreviewLayer.self
    }
    
}

struct CameraPreviewView: UIViewRepresentable {
    
    private let session: AVCaptureSession
    
    init(session: AVCaptureSession) {
        self.session = session
    }
    
    func makeUIView(context: Context) -> UIView {
        let view = PreviewView()
        view.backgroundColor = .black
        view.videoPreviewLayer.session = session
//        view.videoPreviewLayer.videoGravity = .resizeAspectFill
//        view.videoPreviewLayer.connection?.videoRotationAngle = 90.0
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
    
}
