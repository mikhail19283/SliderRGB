//
//  ContentView.swift
//  SliderRGB
//
//  Created by Mikhail Kamynin on 24.01.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var sliderRedColor = Double.random(in: 0...255)
    @State private var sliderGreenColor = Double.random(in: 0...255)
    @State private var sliderBlueColor = Double.random(in: 0...255)
    
    var body: some View {
        ZStack {
            VStack {
                Rectangle()
                    .padding()
                    .foregroundColor(Color(red: sliderRedColor / 255, green: sliderGreenColor / 255, blue: sliderBlueColor / 255, opacity: 1.0))
                
                SliderView(value: $sliderRedColor, color: .red)
                SliderView(value: $sliderGreenColor, color: .green)
                SliderView(value: $sliderBlueColor, color: .blue)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct SliderView: View {
    
    @Binding var value: Double
    @FocusState var isInputActive: Bool
    var color: Color
    
    var body: some View {
        
        
        HStack {
            Text("\(value, specifier: "%.0f")")
                .padding()
            
            Slider(value: $value, in: 0...255, step: 1)
                .accentColor(color)
            TextField("", value: $value, formatter: NumberFormatter())
                .frame(width: 60.0)
                .textFieldStyle(.roundedBorder)
                .focused($isInputActive)
                .keyboardType(.decimalPad)
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        
                        Button("Done") {
                            isInputActive = false
                        }
                    }
                }
        }
    }
}

