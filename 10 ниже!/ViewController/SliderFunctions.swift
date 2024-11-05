


import UIKit

extension ViewController {
    
    
    //MARK: - createBetSlider
    
    public func createBetSlider(_ slider: UISlider) {
        
        slider.frame = CGRect(x: 30, y: 550, width: 220, height: 50)
        slider.minimumValue = 0.0
        slider.maximumValue = Float(self.currentBalance)
        
        slider.addTarget(self, action: #selector(sliderChanged(slider: )), for: .valueChanged)
        
        self.view.addSubview(slider)
    }
    
    
    // MARK: - Slider Bet
    
    @objc func sliderChanged(slider: UISlider) {
        let roundedValue = Int(roundToNearestFifty(Double(slider.value)))
        
        // Если округленное значение больше баланса, показываем баланс
        if roundedValue > Int(currentBalance) {
            ownBetTextField.text = String(Int(currentBalance))
        } else {
            ownBetTextField.text = String(roundedValue)
        }
    }
    private func roundToNearestFifty(_ value: Double) -> Double {
        return round(value / 50) * 50
    }
    
    

    public func updateSliderMaxValue() {
        
        // Устанавливаем максимум слайдера как ближайшее большее значение кратное 50
        let maxRoundedBalance = roundToNearestFifty(Double(currentBalance))
        betSlider.maximumValue = Float(maxRoundedBalance)
    }
    

    
}
