//
//  ViewController.swift
//  BigMacCurrencyConvert
//
//  Created by 조아라 on 6/3/24.
//

import UIKit

class ViewController: UIViewController {
    
    let fromCountryLabel = UILabel()
    let toCountryLabel = UILabel()
    let fromAmountTextField = UITextField()
    let fromAmountSuffixLabel = UILabel()
    let toAmountLabel = UILabel()
    let toAmountSuffixLabel = UILabel()
    let exchangeButton = UIButton()
    let bigMacCountbox = UITextField()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = .black
        
        // ** 한국 원화는 고정값으로 변경 예정.
        fromCountryLabel.text = "🇰🇷 대한민국"
        fromCountryLabel.textColor = .white
        fromCountryLabel.font = UIFont.systemFont(ofSize: 14)
        fromCountryLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(fromCountryLabel)
        
        // ** 미국 달러 이외, 다른 나라도 선택 가능하게 수정 예정
        toCountryLabel.text = "🇺🇸 미국"
        toCountryLabel.textColor = .white
        toCountryLabel.font = UIFont.systemFont(ofSize: 14)
        toCountryLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(toCountryLabel)
        
        // 원화 임의값
        fromAmountTextField.text = "1,300,000"
        fromAmountTextField.textColor = .white
        fromAmountTextField.font = UIFont.boldSystemFont(ofSize: 36)
        fromAmountTextField.translatesAutoresizingMaskIntoConstraints = false
        fromAmountTextField.borderStyle = .none
        fromAmountTextField.keyboardType = .numberPad
        fromAmountTextField.textAlignment = .right
        view.addSubview(fromAmountTextField)
        
        //원화가 고정이라 원 고정.
        fromAmountSuffixLabel.text = " 원"
        fromAmountSuffixLabel.textColor = .white
        fromAmountSuffixLabel.font = UIFont.boldSystemFont(ofSize: 36)
        fromAmountSuffixLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(fromAmountSuffixLabel)
        
        
        
        toAmountLabel.text = "1,000"
        toAmountLabel.textColor = .lightGray
        toAmountLabel.font = UIFont.boldSystemFont(ofSize: 36)
        toAmountLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(toAmountLabel)
        
        
        
        toAmountSuffixLabel.text = " 달러"
        toAmountSuffixLabel.textColor = .lightGray
        toAmountSuffixLabel.font = UIFont.boldSystemFont(ofSize: 36)
        toAmountSuffixLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(toAmountSuffixLabel)
        
        //환전 버튼
        
        exchangeButton.setTitle("⇆", for: .normal)
        exchangeButton.setTitleColor(.white, for: .normal)
        exchangeButton.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        exchangeButton.translatesAutoresizingMaskIntoConstraints = false
        exchangeButton.addTarget(self, action: #selector(exchangeButtonTapped), for: .touchUpInside)
        view.addSubview(exchangeButton)
        
        bigMacCountbox.text = "빅맥을 한개 살 수 있어요"
        bigMacCountbox.textColor = .white
        bigMacCountbox.font = UIFont.boldSystemFont(ofSize: 20)
        bigMacCountbox.translatesAutoresizingMaskIntoConstraints = false
        bigMacCountbox.backgroundColor = .lightGray
        bigMacCountbox.textAlignment = .center
        bigMacCountbox.layer.cornerRadius = 20
        view.addSubview(bigMacCountbox)
        
        
        
        
        NSLayoutConstraint.activate([
            
            fromCountryLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            fromCountryLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            
            fromAmountTextField.topAnchor.constraint(equalTo: fromCountryLabel.bottomAnchor, constant: 20),
            fromAmountTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            
            fromAmountSuffixLabel.centerYAnchor.constraint(equalTo: fromAmountTextField.centerYAnchor),
            fromAmountSuffixLabel.leadingAnchor.constraint(equalTo: fromAmountTextField.trailingAnchor, constant: 5),
            fromAmountSuffixLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            
            exchangeButton.topAnchor.constraint(equalTo: fromAmountTextField.bottomAnchor, constant: 10),
            exchangeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            
            toCountryLabel.topAnchor.constraint(equalTo: exchangeButton.bottomAnchor, constant: 10),
            toCountryLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            
            toAmountLabel.topAnchor.constraint(equalTo: toCountryLabel.bottomAnchor, constant: 10),
            toAmountLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            
            toAmountSuffixLabel.centerYAnchor.constraint(equalTo: toAmountLabel.centerYAnchor),
            toAmountSuffixLabel.leadingAnchor.constraint(equalTo: toAmountLabel.trailingAnchor, constant: 5),
            toAmountSuffixLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            bigMacCountbox.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bigMacCountbox.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            bigMacCountbox.widthAnchor.constraint(equalToConstant: 320),
            bigMacCountbox.heightAnchor.constraint(equalToConstant: 220)
        ])
    }
    
    @objc func exchangeButtonTapped() {
        guard let fromAmountText = fromAmountTextField.text, let fromAmount = Double(fromAmountText.replacingOccurrences(of: ",", with: ""))else { return }
        
        let exchangeRate = 1300.0 // 환율을 API해 가져오도록 변경 해야해요
        let toAmount = fromAmount / exchangeRate
        
        toAmountLabel.text = String(format: "%.2f", toAmount)
        toAmountLabel.textColor = .white
        toAmountSuffixLabel.textColor = .white
    }
}

