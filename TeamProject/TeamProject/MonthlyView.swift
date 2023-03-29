//
//  CalendarView.swift
//  TeamProject
//
//  Created by Sam Sung on 2023/03/29.
//

import UIKit
import FSCalendar

class MonthlyView: UIView {
    
//    let mainLabel: UILabel = {
//       let label = UILabel()
//        label.text = "23년 3월"
//        label.font = UIFont.boldSystemFont(ofSize: 28)
//        label.backgroundColor = .clear
//        label.tintColor = .black
//        return label
//    }()
    
    let calendarView: FSCalendar = {
        let cal = FSCalendar()
        cal.locale = Locale(identifier: "ko_KR")
        cal.backgroundColor = .white
//        cal.appearance.titlePlaceholderColor = UIColor.white.withAlphaComponent(0.2)
        // 위아래로 넘기기
        cal.scrollEnabled = true
        cal.scrollDirection = .vertical
//        cal.appearance.headerMinimumDissolvedAlpha = 0.0
        // 년월
        cal.appearance.headerDateFormat = "YYYY년 MM월"
        cal.appearance.headerTitleFont = UIFont.boldSystemFont(ofSize: 28)
        cal.appearance.headerTitleColor = .black
        cal.appearance.headerTitleAlignment = .left
        // 요일
        cal.weekdayHeight = 100
        cal.appearance.weekdayFont = UIFont.boldSystemFont(ofSize: 20)
        cal.appearance.weekdayTextColor = .black
        // 날짜
        cal.appearance.todayColor = UIColor(named: "mainColor")
        cal.appearance.titleFont = UIFont.systemFont(ofSize: 20)
        cal.appearance.titleDefaultColor = .black
        cal.appearance.titleWeekendColor = UIColor(named: "subRedColor")
        cal.appearance.selectionColor = UIColor(named: "subGreenColor")
        cal.appearance.eventDefaultColor = UIColor(named: "subPinkColor")
        cal.appearance.titleTodayColor = .black
        cal.appearance.subtitleDefaultColor = .black
        cal.appearance.subtitleTodayColor = .black
        return cal
    }()
    
    // MARK: - initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - set UI()
    func setUI() {
        self.backgroundColor = .white
//        self.addSubview(mainLabel)
        self.addSubview(calendarView)
        setAutolayout()
    }
    
    
    // MARK: - set Autolayout()
    func setAutolayout() {
//        mainLabel.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            mainLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 55),
//            mainLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 31)
//        ])
        
        calendarView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            calendarView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 25),
            calendarView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 31),
            calendarView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -31),
            calendarView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -175)
        ])
    }
    
    
    
}
