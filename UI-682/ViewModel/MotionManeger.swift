//
//  MotionManeger.swift
//  UI-682
//
//  Created by nyannyan0328 on 2022/09/27.
//

import SwiftUI
import CoreMotion

class MotionManeger: ObservableObject {
    
    @Published var manager : CMMotionManager = .init()
    @Published var xValue : CGFloat = 0
    
    @Published var currentSlider : Place = sample_places.first!
    
    func detectMotion(){
        
        if !manager.isDeviceMotionActive{
            
            manager.deviceMotionUpdateInterval = 1/40
            manager.startDeviceMotionUpdates(to: .main) { [weak self] motion, err in
                
                if let attitude = motion?.attitude{
                    
                    self?.xValue = attitude.roll
                    
                }
            }
        }
        
    }
    func stopMotionUpdates(){
        
        manager.startDeviceMotionUpdates()
    }
    
}

