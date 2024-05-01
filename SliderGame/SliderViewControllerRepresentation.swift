//
//  SliderViewControllerRepresentation.swift
//  SliderGame
//
//  Created by Carlos Garcia Perez on 30/4/24.
//

import SwiftUI

struct SliderViewRepresentation: UIViewRepresentable {
    @Binding var targetValue: Int
    @Binding var currentValue: Double
    let action: () -> Void
    
    func makeUIView(context: Context) -> UISlider {
        let slider =  UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.setValue(Float(currentValue), animated: true)
        slider.thumbTintColor = .red
       
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.sliderChanged),
            for: .valueChanged
        )
        updateAlpha(slider)
        return slider
    }
        func updateUIView(_ uiView: UISlider, context: Context) {
            uiView.value = Float(currentValue)
            updateAlpha(uiView)
        }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(currentValue: $currentValue, targetValue: $targetValue, action: action)
    }
    private func updateAlpha(_ slider: UISlider) {
        let distance = abs(Double(targetValue) - currentValue)
        slider.alpha = 1.0 - min(1.0, distance / 100)
    }
}
extension SliderViewRepresentation {
    final class Coordinator: NSObject {
        @Binding var currentValue: Double
        @Binding var targetValue: Int
        let action: () -> Void
        
        init(currentValue: Binding<Double>, targetValue: Binding<Int>, action: @escaping () -> Void) {
            self._currentValue = currentValue
            self._targetValue = targetValue
            self.action = action
        }
        @objc func sliderChanged(_ sender: UISlider) {
            currentValue = Double(sender.value)
            withAnimation {
                action()
            }
        }
    }
}
#Preview {
    SliderViewRepresentation(targetValue: .constant(1), currentValue: .constant(0.0)) {}
}



