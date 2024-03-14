//
//  ContentView.swift
//  Calculator-SwiftUI
//
//  Created by Anuradha Desilva on 13/03/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var value = "0"
    @State var runningNumber:Double = 0
    @State var currentOperation: Operation = .none
    
    let buttons: [[CalculatorButtons]] = [
        [.clear, .negative, .precent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .substract],
        [.three, .two, .one , .add ],
        [.zero, .decimal, .equal]
    ]
    var body: some View {
        VStack{
            
        }
        Spacer()
        VStack {
            HStack {
                Spacer()
                Text(value)
                    .bold()
                    .font(.system(size: 100))
                    .foregroundColor(.black)
            }
            .padding()
            ForEach(buttons, id: \.self){ raw in
                HStack{
                    ForEach(raw, id: \.self) { item in
                        Button{
                            self.didTap(button: item)
                        }label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 100.0)
                                    .frame(width: self.buttonWidth(item: item), height: self.buttonHeight())
                                    .foregroundColor(item.buttonColor)
                                Text(item.rawValue)
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                    .foregroundColor(.black)
                            }
                        }
                    }
                }
            }
        }
        .padding()
    }
    func didTap(button : CalculatorButtons){
        switch button {
        case .add, .substract, .multiply, .divide, .equal :
            if button == .add {
                self.currentOperation = .add
                self.runningNumber = Double(self.value) ?? 0.0
            } else if button == .substract {
                self.currentOperation = .substract
                self.runningNumber = Double(self.value) ?? 0
            } else if button == .divide {
                self.currentOperation = .divide
                self.runningNumber = Double(self.value) ?? 0
            }else if button == .multiply {
                self.currentOperation = .multiply
                self.runningNumber = Double(self.value) ?? 0
            }else if button == .equal {
                let runningValue = self.runningNumber
                let currentValue = Double(self.value) ?? 0
                switch self.currentOperation {
                case .add:
                    self.value = "\(runningValue + currentValue)"
                case .substract:
                    self.value = "\(runningValue - currentValue)"
                case .divide:
                    self.value = "\(runningValue / currentValue)"
                case .multiply:
                    self.value = "\(runningValue * currentValue)"
                case .none:
                    break
                }
            }
            if button != .equal{
                self.value = "0"
            }
        case .clear :
            self.value = "0"
        default :
            let number = button.rawValue
            
            if self.value == "0" {
                value = number
            } else {
                value = "\(value)\(number)"
            }
      
        }
        
    }
    
    func buttonWidth(item:CalculatorButtons) -> CGFloat{
        if item == .zero {
            return ((UIScreen.main.bounds.width - (4*12)) / 4)*2
        }
        return (UIScreen.main.bounds.width - (5*12)) / 4
    }
    func buttonHeight() -> CGFloat{
        return (UIScreen.main.bounds.width - (5*12)) / 4
    }
}

#Preview {
    ContentView()
}
