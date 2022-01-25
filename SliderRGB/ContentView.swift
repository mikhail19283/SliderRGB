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
    @FocusState private var isInputActive: Bool
    
    var body: some View {
        ZStack {
            Color.teal.opacity(0.5)
                .ignoresSafeArea()
            VStack {
                Rectangle()
                    .frame(width: 350, height: 200)
                    .cornerRadius(30)
                    .foregroundColor(Color(red: sliderRedColor / 255, green: sliderGreenColor / 255, blue: sliderBlueColor / 255, opacity: 1.0))
                
                SliderView(value: $sliderRedColor, isInputActive: $isInputActive, color: .red)
                SliderView(value: $sliderGreenColor, isInputActive: $isInputActive, color: .green)
                SliderView(value: $sliderBlueColor, isInputActive: $isInputActive, color: .blue)
            }
            .padding(EdgeInsets(top: -100, leading: 20, bottom: 0, trailing: 20))
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct SliderView: View {
    
    @Binding var value: Double
    var isInputActive: FocusState<Bool>.Binding
    var color: Color
    
    var body: some View {
        HStack {
            Text("\(value, specifier: "%.0f")")
                .frame(width: 50)
            Slider(value: $value, in: 0...255, step: 1)
                .accentColor(color)
            TextField("", value: $value, formatter: NumberFormatter())
                .frame(width: 50.0)
                .textFieldStyle(.roundedBorder)
                .focused(isInputActive)
                .keyboardType(.decimalPad)
        }
    }
}

