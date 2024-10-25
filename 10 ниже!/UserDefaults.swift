//
//  UserDefaults.swift
//  10 ниже!
//
//  Created by Раджаб Магомедов on 24.10.2024.
//

import UIKit

extension ViewController {
    
    func uploadUserInfo(_ userDefaults: UserDefaults) {
        
        
         if let balance = userDefaults.object(forKey: "balance") {
             currentBalance = balance as! Int
             // обновляем view
             updateBalance(newBalance: currentBalance)
         }
        
        
    }
        
        
    func saveUserInfo(_ value: Any?, forKey: Any?) {
        
        switch forKey.self {
        case is String: userDefaults.set(value, forKey: forKey as! String)
        case is Int: userDefaults.setValue(value, forKey: forKey as! String)
            
        default: print("ОШИБКА в сохранении данных в методе saveUserInfo!")
        }
    }
    
}


