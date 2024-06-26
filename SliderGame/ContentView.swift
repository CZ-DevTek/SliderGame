//
//  ContentView.swift
//  SliderGame
//
//  Created by Carlos Garcia Perez on 28/4/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showAlert = false
    @State private var targetValue = Int.random(in: 0...100)
    @State private var currentValue: Double = 50.0
    
    let action: () -> Void = {}
    
    var body: some View {
        VStack {
            Text("Сдвиньте слайдер как можно ближе к: \(targetValue)")
            
            HStack {
                Text("0")
                SliderViewRepresentation(targetValue: $targetValue, currentValue: $currentValue, action: sliderChanged)
                Text("100")
            }
            .padding(.leading, 6)
            .padding(.trailing, 6)
            
            Button("проверьте меня") {
                showAlert = true
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Your Score is: \(computeScore())"),
                    dismissButton: .default(Text("OK"))
                )
            }
            
            Button("начать заново") {
                targetValue = Int.random(in: 0...100)
            }
            .padding(10)
        }
    }
    private func sliderChanged() {
        print("Slider value changed to: \(currentValue)")
    }
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
}
#Preview {
    ContentView()
}

