//
//  BarButtonItems - ViewController.swift
//  10 ниже!
//
//  Created by Раджаб Магомедов on 25.10.2024.
//

import UIKit

extension ViewController {
    
    
    //MARK: - RightBarButtonItem

    func createRightBarBattonItem(_ button: UIButton) -> UIBarButtonItem {
        
        button.frame.size = CGSize(width: 150, height: 40)
        button.backgroundColor = UIColor(red: 0.2, green: 0.64, blue: 0.53, alpha: 1)
        button.layer.cornerRadius = 14
    
        button.setTitle("Баланс: " + String(currentBalance), for: .normal)
        
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        
        
        let customView = UIView(frame: button.bounds)
        customView.addSubview(button)
        
        
        button.addTarget(self, action: #selector(rightBarBattonTapped), for: .touchUpInside)
        
        
        
        let barButtonItem = UIBarButtonItem(customView: customView)
        
        return barButtonItem
        
    }
    
    @objc func rightBarBattonTapped() {
        
        self.navigationController?.pushViewController(PaymentViewController(), animated: true)
        
    }
    
    func updateBalance(newBalance: Int) {
        
        currentBalance = newBalance
        
        //update navigationBarBalance
        let newBalanceButton = createRightBarBattonItem(balanceButton)
        self.navigationItem.rightBarButtonItem = newBalanceButton
        
        saveUserInfo(currentBalance, forKey: "balance")
        
    }
    
    //MARK: - LeftBarButtonItem
    
    
    public func createLeftBarButtonItem(_ button: UIButton) -> UIBarButtonItem {
        
        button.frame.size = CGSize(width: 70, height: 40)
        button.backgroundColor = UIColor(red: 0.2, green: 0.64, blue: 0.53, alpha: 1)
        button.layer.cornerRadius = 14
        button.setTitle("Menu", for: .normal)
        button.setTitleColor(.black, for: .normal)
    
        
        
        let customView = UIView(frame: button.bounds)
        customView.addSubview(button)
        
        button.addTarget(self, action: #selector(leftBarBattonTapped), for: .touchUpInside)
        
        
        let barButtonItem = UIBarButtonItem(customView: customView)
        
        return barButtonItem
        
    }
    
    
    @objc func leftBarBattonTapped() {
        goBack()
    }
    
}

