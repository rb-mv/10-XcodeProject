//
//  Alerts.swift
//  10 ниже!
//
//  Created by Раджаб Магомедов on 18.10.2024.
//

import UIKit

extension ViewController {
    
    
    func alert(title: String, message: String, answer: String?, style: UIAlertController.Style){
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        
        let action = UIAlertAction(title: answer, style: .default) { (action) in
        }
        
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    
}
