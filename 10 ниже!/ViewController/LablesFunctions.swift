//
//  LablesFunctions.swift
//  10 ниже!
//
//  Created by Раджаб Магомедов on 04.10.2024.
//

import UIKit

extension ViewController {
    
    
    //MARK: - BalanceLable
    
    func createBallanceLable() {
        
        balanceLable.text = "Баланс: " + String(currentBalance)
        balanceLable.frame = CGRect(x: 30, y: 100, width: 300, height: 50)
        balanceLable.layer.cornerRadius = 14
        balanceLable.textColor = UIColor.black
        balanceLable.textAlignment = .center
        balanceLable.font = .boldSystemFont(ofSize: 17)
        balanceLable.layer.cornerRadius = 10
        balanceLable.backgroundColor = UIColor(red: 0.2, green: 0.64, blue: 0.53, alpha: 1)
        balanceLable.layer.borderColor = nil
        balanceLable.layer.borderColor = CGColor(red: 0.4, green: 0.82, blue: 0.71, alpha: 1)
        balanceLable.layer.borderWidth = 3.0
        balanceLable.layer.masksToBounds = true
        
        self.view.addSubview(self.balanceLable)
    }
    
    
    
}

