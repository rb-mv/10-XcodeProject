//
//  NavigationVC.swift
//  10 ниже!
//
//  Created by Раджаб Магомедов on 21.10.2024.
//

import UIKit

extension ViewController {
    
    
    @objc func goBack() {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
}
