//
//  SegmentedControllerFunctions.swift
//  10 ниже!
//
//  Created by Раджаб Магомедов on 04.10.2024.
//

import UIKit

extension ViewController {
    
    func createSegmentedControl(_ segControl: inout UISegmentedControl) {
        
        segControl = UISegmentedControl(items: ["1x", "2x", "3x", "4x", "5x"])
        segControl.frame = CGRect(x: 30, y: 650, width: 250, height: 50)
        segControl.layer.cornerRadius = 14
        segControl.setTitleTextAttributes([.font: UIFont.systemFont(ofSize: 17)], for: .normal)
        segControl.selectedSegmentIndex = 0
        
        self.view.addSubview(segControl)
    }
}
