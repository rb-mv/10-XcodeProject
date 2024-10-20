//
//  LablesFunctions.swift
//  10 ниже!
//
//  Created by Раджаб Магомедов on 04.10.2024.
//

import UIKit

extension ViewController {
    
    
    //MARK: - BalanceLabel
    
    func createBallanceLable(_ label: UILabel) {
        
        label.text = "Баланс: " + String(currentBalance)
        label.frame = CGRect(x: 30, y: 100, width: 300, height: 50)
        label.layer.cornerRadius = 14
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 17)
        label.layer.cornerRadius = 10
        label.backgroundColor = UIColor(red: 0.2, green: 0.64, blue: 0.53, alpha: 1)
        label.layer.borderColor = nil
        label.layer.borderColor = CGColor(red: 0.4, green: 0.82, blue: 0.71, alpha: 1)
        label.layer.borderWidth = 3.0
        label.layer.masksToBounds = true
        
        self.view.addSubview(label)
    }
    
    
    
}

