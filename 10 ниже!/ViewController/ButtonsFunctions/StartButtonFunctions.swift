//
//  StartButtonFunctions.swift
//  10 ниже!
//
//  Created by Раджаб Магомедов on 04.10.2024.
//

import UIKit

extension ViewController {
    
    
    //MARK: - Create startButton
    
    func createStartButton(_ button: UIButton) {
        
        button.frame = CGRect(x: 50, y: 750, width: 300, height: 70)
        button.setTitle("Start", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.setTitleColor(UIColor.orange, for: .normal)
        button.backgroundColor = UIColor.systemYellow
        button.layer.cornerRadius = 16
        button.clipsToBounds = true
        
        let startButtonImage  = UIImage(named: "play")
        
        button.setImage(startButtonImage, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        
        button.contentHorizontalAlignment = .left
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 10)
        
        
        button.addTarget(self, action: #selector(startButtonCheck), for: .touchDown)
        
        self.view.addSubview(button)
    }
    
    
    // MARK: - StartButtonCheck
    
    @objc func startButtonCheck(_ button: UIButton) {
        guard validateSelection(), validateBet(), validateBalance() else { return }
        startTheGame()
    }

    // MARK: - Validation

    private func validateSelection() -> Bool {
        guard clickedButtonsArray.count == 5 else {
            alert(title: "Выберите 5 ячеек!", message: "Должно быть выбрано 5 чисел для начала игры", answer: "Хорошо", style: .actionSheet)
            return false
        }
        return true
    }

    private func validateBet() -> Bool {
        guard let bet = ownBetUnwrap(), bet > 0 else {
            alert(title: "Ставка не указана!", message: "Укажите ставку с помощью ползунка или введите вручную", answer: "Ок", style: .actionSheet)
            return false
        }
        return true
    }

    private func validateBalance() -> Bool {
        guard currentBalance >= ownBetUnwrap()! else {
            
            alert(title: "Пополните баланс!", message: "Перейдите в вкладку кошелек и пополните баланс удобным способом", answer: "Ок", style: .actionSheet)
            return false
        }
        return true
    }

    // MARK: - Game Logic

    private func startTheGame() {
        let randomArray = generateRandomNumbers(count: 5, range: 1...24)
        let matchedNumbers = findMatchingNumbers(in: randomArray, from: clickedButtonsArray)
        updateBalanceInfo(matchingCount: matchedNumbers.count)
        updateUI()
        
        // Debugging output
        printGameDetails(randomArray: randomArray, matchedNumbers: matchedNumbers)
    }

    private func generateRandomNumbers(count: Int, range: ClosedRange<Int>) -> [Int] {
        var randomNumbers = Set<Int>()  // Используем Set для обеспечения уникальности чисел
        while randomNumbers.count < count {
            randomNumbers.insert(Int.random(in: range))
        }
        return Array(randomNumbers)
    }
    

    private func findMatchingNumbers(in randomArray: [Int], from selectedNumbers: [Int]) -> [Int] {
        // Ищем совпадения между сгенерированными числами и выбранными пользователем
        return randomArray.filter { selectedNumbers.contains($0) }
    }
    

    private func updateBalanceInfo(matchingCount: Int) {
        
        guard let bet = ownBetUnwrap() else { return }
        
        let multiplier: Double
        
        switch coefSegmentedControl.selectedSegmentIndex {
        case 0:
            multiplier = 1.5
        default:
            multiplier = Double(coefSegmentedControl.selectedSegmentIndex + 1)
        }
        
        if matchingCount == coefSegmentedControl.selectedSegmentIndex + 1 {
            let newBalance = currentBalance + Int(Double(bet) * multiplier)  // Выигрыш, если совпадений достаточно
            updateBalance(newBalance: newBalance)
        } else {
            let newBalance = currentBalance - bet // Убыток, если совпадений недостаточно
            updateBalance(newBalance: newBalance)
        }
    }

    private func updateUI() {
        
        // Обновляем метку баланса и значение ползунка
        balanceButton.titleLabel?.text = "Баланс: \(currentBalance)"
        sliderMaxValueUpdate()
    }

    private func printGameDetails(randomArray: [Int], matchedNumbers: [Int]) {
        // Отладочная информация для проверки работы программы
        print("Сгенерированные цифры: \(randomArray)")
        print("Выбранные цифры: \(clickedButtonsArray)")
        print("Совпавшие цифры: \(matchedNumbers)")
        print("Текущий баланс: \(currentBalance)")
        print("Выбранный коэффициент: \(coefSegmentedControl.selectedSegmentIndex + 1)x")
    }
    
    
    
    
    
    
    
    
    
    
}
