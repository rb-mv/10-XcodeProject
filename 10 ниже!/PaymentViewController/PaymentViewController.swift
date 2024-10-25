//
//  PaymentViewController.swift
//  10 ниже!
//
//  Created by Раджаб Магомедов on 24.10.2024.
//

import UIKit

class PaymentViewController: UIViewController {
    
    
    let payButton = UIButton()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        payButton.frame = CGRect(x: 0, y: 0, width: 300, height: 50)
        payButton.titleLabel?.text = "Пополнить счет"
        payButton.center = view.center
        payButton.backgroundColor = .orange
        payButton.setTitleColor(.black, for: .normal)
        payButton.layer.cornerRadius = 14
        
        view.addSubview(self.payButton)
        
        view.backgroundColor = .white
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
