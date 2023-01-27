//
//  ResultViewController.swift
//  BMI App
//
//  Created by Cubastion on 27/01/23.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var recalculateBtn: UIButton!
    @IBOutlet weak var resultLbl: UILabel!
    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var bmilabel: UILabel!
    @IBOutlet weak var resultfrombmi: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupvc()
        
    }
    
    func setupvc(){
        self.view.backgroundColor = .systemBackground
        self.resultLbl.text = "Result"
        self.resultLbl.font = UIFont.systemFont(ofSize: 30)
        self.resultImage.backgroundColor = .systemBackground
        self.recalculateBtn.setTitle("Recalculate", for: .normal)
        self.recalculateBtn.addTarget(self, action: #selector(recalc(_ :)), for: .touchUpInside)
    }
    
    @objc func recalc(_ sender: UIButton){
        dismiss(animated: true, completion: nil)
    }

}
