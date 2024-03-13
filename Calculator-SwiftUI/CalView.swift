//
//  CalView.swift
//  Calculator-SwiftUI
//
//  Created by Anuradha Desilva on 13/03/2024.
//

import SwiftUI

enum CalculatorButtons: String{
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case substract = "-"
    case add = "+"
    case divide = "/"
    case multiply = "x"
    case equal = "="
    case clear = "AC"
    case decimal = "."
    case precent = "%"
    case negative = "-/+"
    
    var buttonColor:Color {
        switch self {
        case .add , .substract, .divide, .equal, .multiply :
            return .orange
        case .clear, .negative, .precent :
            return Color(.systemGray)
        default:
            return Color(UIColor(red: 55/255.0, green: 55/255.0, blue: 55/255.0, alpha: 1))
        
        }
    }
}
enum operation {
    case add, subtract, divide, multiply, none
}
