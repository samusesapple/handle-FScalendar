//
//  MonthlyHeaderView.swift
//  TeamProject
//
//  Created by Sam Sung on 2023/04/09.
//

import UIKit

class MonthlyNavigationStackView: UIStackView {
    
    var baseDate: Date = Date() {
        didSet {
            changeMonthLabel()
        }
    }

    // MARK: - Properties
    
    private let calendarDateLabel: UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 28)
        return label
    }()
    
     let menuButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        button.tintColor = .black
        button.setImage(UIImage(systemName: "text.justify"), for: .normal)
        return button
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        addSubview(calendarDateLabel)
        addSubview(menuButton)
        
        setAutolayout()
        changeMonthLabel()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Helpers
    
    func setAutolayout() {
        calendarDateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([calendarDateLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 31), calendarDateLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)])
        
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([menuButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -27), menuButton.centerYAnchor.constraint(equalTo: calendarDateLabel.centerYAnchor, constant: -3), menuButton.widthAnchor.constraint(equalToConstant: 30)])
    }
    
    func changeMonthLabel() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy년 MM월"
        calendarDateLabel.text = dateFormatter.string(from: baseDate)
        print("Month data changed")
    }
    
}
