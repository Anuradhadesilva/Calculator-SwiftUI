//
//  ContentView.swift
//  Calculator-SwiftUI
//
//  Created by Anuradha Desilva on 13/03/2024.
//

import SwiftUI

struct ContentView: View {
    
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
            ForEach(buttons, id: \.self){ raw in
                HStack{
                    ForEach(raw, id: \.self) { item in
                        Button{
                            
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
