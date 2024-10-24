//
//  ButtonsMenuVC.swift
//  10 ниже!
//
//  Created by Раджаб Магомедов on 21.10.2024.
//

import UIKit

extension menuViewController {
    
    func createStartMenuButton(_ button: UIButton) {
        
        let buttonWidth = self.view.bounds.width/2.5
        let buttonHight = self.view.bounds.height/10
        let buttonX = self.view.center.x - buttonWidth/2
        let buttonY = self.view.center.y - buttonHight/0.85
        
        
        button.frame = CGRect(x: buttonX,
                              y: buttonY,
                              width: buttonWidth,
                              height: buttonHight)
        
        button.backgroundColor = .green
        button.layer.cornerRadius = 15
        
        button.setTitle("Play", for: .normal)
        button.setTitleColor(.black, for: .normal)
        
        
        button.addTarget(self, action: #selector(perfonmDisplayGameVC), for: .touchUpInside)
        
        self.view.addSubview(button)
    }
    
    func createStatisticsMenuButton(_ button: UIButton) {
        
        let buttonWidth = self.view.bounds.width/2.5
        let buttonHight = self.view.bounds.height/10
        let buttonX = self.view.center.x - buttonWidth/2
        let buttonY = self.view.center.y
        
        button.frame = CGRect(x: buttonX, y: buttonY,
                              width: buttonWidth,
                              height: buttonHight)
        
        
        button.backgroundColor = .orange
        button.layer.cornerRadius = 15
        
        button.setTitle("Statistics", for: .normal)
        button.setTitleColor(.black, for: .normal)

        
        //button.center = self.view.center
        button.addTarget(self, action: #selector(perfonmDisplayGameVC), for: .touchUpInside)
        
        self.view.addSubview(button)
    }
    
    func createSettingsMenuBatton(_ button: UIButton) {
        
        let buttonWidth = self.view.bounds.width/2.5
        let buttonHight = self.view.bounds.height/10
        let buttonX = self.view.center.x - buttonWidth/2
        let buttonY = self.view.center.y + buttonHight/0.85
        
        button.frame = CGRect(x: buttonX,
                              y: buttonY,
                              width: buttonWidth,
                              height: buttonHight)
        
        button.backgroundColor = .gray
        button.layer.cornerRadius = 15
        
        
        button.setTitle("Settings", for: .normal)
        button.setTitleColor(.black, for: .normal)

        
        
        button.addTarget(self, action: #selector(perfonmDisplayGameVC), for: .touchUpInside)
        
        self.view.addSubview(button)
    }
    
    
    
    
    @objc func perfonmDisplayGameVC(parametr Sender: Any) {
        
        let gameVC = ViewController()
        
        self.navigationController?.pushViewController(gameVC, animated: true )
        
    }
    
    
}
