//
//  BMICalculator.swift
//  BMI App
//
//  Created by Cubastion on 27/01/23.
//

import Foundation
import UIKit


class BMICalculator {
    
    var height : Float
    var weight : Float
    
    init(height : Float, weight : Float) {
        self.height = height
        self.weight = weight
    }
    
    func getBMIValue() -> Float{
        let calculatedBMI = self.weight / (self.height * self.height)
        return calculatedBMI
    }
    
    func getStatusBMI(_ bmi: Float) -> [String] {
        if bmi < 16.0 {
            return ["Severe Thinness", "attenImg"]
        }else if bmi >= 16.0 && bmi < 17.0 {
            return ["Moderate Thinness", "attenImg"]
        }else if bmi >= 17.0 && bmi < 18.5 {
            return ["Mild Thinness", "attenImg"]
        }else if bmi >= 18.5 && bmi < 25.0 {
            return ["Normal", "normalImg"]
        }else if bmi >= 25.0 && bmi < 30.0 {
            return ["Overweight", "attenImg"]
        }else if bmi >=  30.0 && bmi < 35.0 {
            return ["Obese Class I", "attenImg"]
        }else if bmi >= 35.0 && bmi < 40.0 {
            return ["Obese Class II", "attenImg"]
        }else if bmi > 40.0 {
            return ["Obese Class III", "attenImg"]
        }else{
            return ["Unable to calculate", ""]
        }
    }
}
