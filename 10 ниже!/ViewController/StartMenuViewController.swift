//
//  StartMenuViewController.swift
//  10 ниже!
//
//  Created by Раджаб Магомедов on 14.09.2024.
//

import UIKit

var ViewControllerSwitcher = 0

class StartMenuViewController: UIViewController {
    
    let startGameButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white

        startGameButton.frame = CGRect(x: 0, y: 0, width: 100, height: 40)
        startGameButton.center = self.view.center
        startGameButton.setTitle("Start", for: .normal)
        startGameButton.backgroundColor = .orange
        
        startGameButton.addTarget(self, action: #selector(StartGameButtonPressed), for: .touchUpOutside)
        
        self.view.addSubview(self.startGameButton)
        
        
    }
    
    @objc func StartGameButtonPressed() {
        
        ViewControllerSwitcher = 1
    }
    
    

}
