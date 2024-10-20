


import UIKit

extension ViewController {
    
    
    //MARK: - createBetSlider
    
    func createBetSlider(_ slider: UISlider) {
        
        slider.frame = CGRect(x: 30, y: 550, width: 220, height: 50)
        slider.minimumValue = 0.0
        slider.maximumValue = Float(self.currentBalance)
        
        slider.addTarget(self, action: #selector(sliderChanged(slider: )), for: .valueChanged)
        
        self.view.addSubview(slider)
    }
    
    
    // Slider Bet
    
    @objc func sliderChanged(slider: UISlider) {
        
        //TODO: сделать так, чтобы при  движении ползунка, движение происходило каждые 50 единиц.
        
        ownBetTextField.text = String(Int(roundToNearestFifty(Double(slider.value))))
        
    }
    
    
    func roundToNearestFifty(_ value: Double) -> Double {
        return round(value / 50) * 50
    }
    
    
    func sliderMaxValueUpdate() {
        betSlider.maximumValue = Float(self.currentBalance)
    }
    

    
}
