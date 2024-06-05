//
//  ViewController.swift
//  BigMacCurrencyConvert
//
//  Created by 조아라 on 6/3/24.


import UIKit

class ViewController: UIViewController {

    let fromCountryLabel = UILabel()
    let toCountryLabel = UILabel()
    let countryPickerView = UIPickerView()
    let countries: [(flag: String, name: String)] = [
        ("🇨🇭", "스위스"), ("🇳🇴", "노르웨이"), ("🇺🇾", "우루과이"), ("🇸🇪", "스웨덴"),
        ("🇪🇺", "유럽 연합"), ("🇺🇸", "미국"), ("🇨🇦", "캐나다"), ("🇦🇺", "오스트레일리아"),
        ("🇧🇷", "브라질"), ("🇬🇧", "영국"), ("🇰🇷", "대한민국"), ("🇸🇦", "사우디 아라비아"),
        ("🇦🇷", "아르헨티나"), ("🇨🇳", "중국"), ("🇮🇳", "인도"), ("🇮🇩", "인도네시아"),
        ("🇵🇭", "필리핀"), ("🇲🇾", "말레이시아"), ("🇪�", "이집트"), ("🇿🇦", "남아프리카 공화국"),
        ("🇺🇦", "우크라이나"), ("🇭🇰", "홍콩"), ("🇻🇳", "베트남"), ("🇯🇵", "일본"),
        ("🇷🇴", "루마니아"), ("🇦🇿", "아제르바이잔"), ("🇯🇴", "요르단"), ("🇲�", "몰도바"),
        ("🇴🇲", "오만"), ("🇹🇼", "대만")]
    let fromAmountTextField = UITextField()
    let fromAmountSuffixLabel = UILabel()
    let toAmountLabel = UILabel()
    let toAmountSuffixLabel = UILabel()
    let exchangeButton = UIButton()
    let bigMacCountbox = UIButton()
    let tooltipButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        view.backgroundColor = .black

        fromCountryLabel.text = "🇰🇷 대한민국"
        fromCountryLabel.textColor = .white
        fromCountryLabel.font = UIFont.systemFont(ofSize: 14)
        fromCountryLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(fromCountryLabel)

        toCountryLabel.text = "🇺🇸 미국"
        toCountryLabel.textColor = .white
        toCountryLabel.font = UIFont.systemFont(ofSize: 14)
        toCountryLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(toCountryLabel)

        countryPickerView.dataSource = self
        countryPickerView.delegate = self
        view.addSubview(countryPickerView)
        countryPickerView.translatesAutoresizingMaskIntoConstraints = false

        fromAmountTextField.text = "1,300,000"
        fromAmountTextField.textColor = .white
        fromAmountTextField.font = UIFont.boldSystemFont(ofSize: 36)
        fromAmountTextField.translatesAutoresizingMaskIntoConstraints = false
        fromAmountTextField.borderStyle = .none
        fromAmountTextField.keyboardType = .numberPad
        fromAmountTextField.textAlignment = .right
        view.addSubview(fromAmountTextField)

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

        exchangeButton.setTitle("⇆", for: .normal)
        exchangeButton.setTitleColor(.white, for: .normal)
        exchangeButton.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        exchangeButton.translatesAutoresizingMaskIntoConstraints = false
        exchangeButton.addTarget(self, action: #selector(exchangeButtonTapped), for: .touchUpInside)
        view.addSubview(exchangeButton)

        bigMacCountbox.setTitle("빅맥을 한개 살 수 있어요", for: .normal)
        bigMacCountbox.setTitleColor(.white, for: .normal)
        bigMacCountbox.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        bigMacCountbox.translatesAutoresizingMaskIntoConstraints = false
        bigMacCountbox.backgroundColor = .lightGray
        bigMacCountbox.layer.cornerRadius = 20
        view.addSubview(bigMacCountbox)

        tooltipButton.setTitle("빅맥지수란?", for: .normal)
        tooltipButton.setTitleColor(.white, for: .normal)
        tooltipButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        tooltipButton.translatesAutoresizingMaskIntoConstraints = false
        tooltipButton.addTarget(self, action: #selector(showTooltip), for: .touchUpInside)
        view.addSubview(tooltipButton)

        NSLayoutConstraint.activate([
            fromCountryLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            fromCountryLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),

            toCountryLabel.topAnchor.constraint(equalTo: fromCountryLabel.bottomAnchor, constant: 10),
            toCountryLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),

            countryPickerView.topAnchor.constraint(equalTo: toCountryLabel.bottomAnchor, constant: 10),
            countryPickerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            countryPickerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            fromAmountTextField.topAnchor.constraint(equalTo: countryPickerView.bottomAnchor, constant: 20),
            fromAmountTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),

            fromAmountSuffixLabel.centerYAnchor.constraint(equalTo: fromAmountTextField.centerYAnchor),
            fromAmountSuffixLabel.leadingAnchor.constraint(equalTo: fromAmountTextField.trailingAnchor, constant: 5),
            fromAmountSuffixLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            exchangeButton.topAnchor.constraint(equalTo: fromAmountTextField.bottomAnchor, constant: 10),
            exchangeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            toAmountLabel.topAnchor.constraint(equalTo: exchangeButton.bottomAnchor, constant: 10),
            toAmountLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),

            toAmountSuffixLabel.centerYAnchor.constraint(equalTo: toAmountLabel.centerYAnchor),
            toAmountSuffixLabel.leadingAnchor.constraint(equalTo: toAmountLabel.trailingAnchor, constant: 5),
            toAmountSuffixLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            bigMacCountbox.topAnchor.constraint(equalTo: toAmountSuffixLabel.bottomAnchor, constant: 20),
            bigMacCountbox.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bigMacCountbox.widthAnchor.constraint(equalToConstant: 300),
            bigMacCountbox.heightAnchor.constraint(equalToConstant: 200),

            tooltipButton.topAnchor.constraint(equalTo: bigMacCountbox.bottomAnchor, constant: 5),
            tooltipButton.trailingAnchor.constraint(equalTo: bigMacCountbox.trailingAnchor, constant: -10)
        ])
    }

    @objc func exchangeButtonTapped() {
        guard let fromAmountText = fromAmountTextField.text, let fromAmount = Double(fromAmountText.replacingOccurrences(of: ",", with: "")) else { return }

        let exchangeRate = 1300.0
        let toAmount = fromAmount / exchangeRate

        toAmountLabel.text = String(format: "%.2f", toAmount)
        toAmountLabel.textColor = .white
        toAmountSuffixLabel.textColor = .white
    }

    @objc func showTooltip() {
        let alert = UIAlertController(title: "빅맥지수란?", message: "이것은 빅맥지수입니다.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countries.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let country = countries[row]
        return "\(country.flag) \(country.name)"
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedCountry = countries[row]
        toCountryLabel.textColor = .white
        toCountryLabel.text = "\(selectedCountry.flag) \(selectedCountry.name)"
    }
}
