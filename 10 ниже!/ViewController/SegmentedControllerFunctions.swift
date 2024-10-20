//
//  SegmentedControllerFunctions.swift
//  10 ниже!
//
//  Created by Раджаб Магомедов on 04.10.2024.
//

import UIKit

extension ViewController {
    
    func createSegmentedControl(contr: inout UISegmentedControl, itemArray: [String]) {
        
        contr = UISegmentedControl(items: itemArray)
        contr.frame = CGRect(x: 30, y: 650, width: 250, height: 50)
        contr.layer.cornerRadius = 14
        contr.setTitleTextAttributes([.font: UIFont.systemFont(ofSize: 17)], for: .normal)
        contr.selectedSegmentIndex = 0
    }
}
