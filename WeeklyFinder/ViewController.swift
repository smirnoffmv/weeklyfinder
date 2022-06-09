//
//  ViewController.swift
//  WeeklyFinder
//
//  Created by Matvey Smirnov on 11.04.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dateTF: UITextField!
    @IBOutlet weak var monthTF: UITextField!
    @IBOutlet weak var yearTF: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    
    @IBAction func findDay(_ sender: UIButton) {
        
        guard let day = dateTF.text, let month = monthTF.text, let year = yearTF.text else { return }
        
            
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        if (day == "" || month == "" || year == "") || (Int(day)! > 31 || Int(month)! > 12) {
            resultLabel.text = "Ошибка"
        } else {
        dateComponents.day = Int(day)
        dateComponents.month = Int(month)
        dateComponents.year = Int(year)
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.dateFormat = "EEEE"
        
        guard let date = calendar.date(from: dateComponents) else { return }
        let weekDay = dateFormatter.string(from: date)
        
        resultLabel.text = weekDay
    }
}
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

