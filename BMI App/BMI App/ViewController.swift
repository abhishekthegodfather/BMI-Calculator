//
//  ViewController.swift
//  BMI App
//
//  Created by Cubastion on 27/01/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var appLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var wightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var calculatebtn: UIButton!
    @IBOutlet weak var heightlabeltxt: UILabel!
    @IBOutlet weak var weightlabeltxt: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setUpThing()
    }
    
    
    func setUpThing(){
        self.view.backgroundColor = .systemBackground
        self.appLabel.text = "BMI Calculator"
        self.appLabel.font = UIFont.systemFont(ofSize: 30)
        self.heightLabel.text = "Height (CM)"
        self.wightLabel.text = "Weight (KG)"
        self.heightlabeltxt.text = "0.00"
        self.weightlabeltxt.text = "20.00"
        self.heightSlider.value = 0
        self.heightSlider.maximumValue = 200
        self.heightSlider.minimumValue = 0
        self.weightSlider.maximumValue = 120
        self.weightSlider.minimumValue = 20
        self.calculatebtn.setTitle("Calculate BMI", for: .normal)
        self.heightSlider.addTarget(self, action: #selector(heightSliderAction(_ :)), for: .valueChanged)
        self.weightSlider.addTarget(self, action: #selector(weightSliderAction(_ :)), for: .valueChanged)
    }

    @IBAction func calcAction(_ sender: UIButton) {
        self.checkSliders()
        let heightValue = self.heightSlider.value
        let reheightValue = heightValue / 100
        let weightValue = self.weightSlider.value
        let newBMI = BMICalculator(height: reheightValue, weight: weightValue)
        let resultBMI = newBMI.getBMIValue()
        let statusResult = newBMI.getStatusBMI(resultBMI)
        
        let resultVC = self.storyboard?.instantiateViewController(withIdentifier: "Result") as! ResultViewController
        resultVC.modalPresentationStyle = .fullScreen
        self.present(resultVC, animated: true, completion: nil)
        
        resultVC.bmilabel.text = String(format: "%.2f", resultBMI)
        resultVC.bmilabel.font = UIFont.systemFont(ofSize: 25)
        
        let startIndex = statusResult.startIndex
        let bmiText = statusResult[startIndex]
        resultVC.resultfrombmi.text = bmiText
        
        let endIndex = statusResult.endIndex - 1
        let bmiImage = statusResult[endIndex]
        resultVC.resultImage.image = UIImage(named: bmiImage)
    }
    
    

    @objc func heightSliderAction(_ sender: UISlider){
        let currentValue = sender.value
        self.heightlabeltxt.text = String(format: "%.2f", currentValue)
    }
    
    @objc func weightSliderAction(_ sender: UISlider){
        let currentValue = sender.value
        self.weightlabeltxt.text = String(format: "%.2f", currentValue)
    }
    
    func checkSliders(){
        
        if self.heightSlider.value == 0.00 && self.weightSlider.value == 20.00{
            self.simpleAlert(msg: "Needed For BMI Calculation", title: "Select height and Weight")
        }
        
        if self.heightSlider.value == 0.00 && weightSlider.value > 20.00 {
            self.simpleAlert(msg: "Needed For BMI Calculation", title: "Select Height")
        }
    }
    
    func simpleAlert(msg: String, title: String){
        let createAlert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        self.present(createAlert, animated: true) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                createAlert.dismiss(animated: true)
            }
        }
    }
    
}

