//
//  CalendarView.swift
//  TeamProject
//
//  Created by Sam Sung on 2023/03/29.
//

import UIKit
import FSCalendar

class CalendarView: UIView {
    
    let calendarView: FSCalendar = {
        let cal = FSCalendar()
        cal.locale = Locale(identifier: "ko_KR")
        cal.backgroundColor = .white
        cal.scrollEnabled = true
        cal.scrollDirection = .horizontal
        cal.placeholderType = .none
        
        // 년월
        cal.calendarHeaderView.isHidden = true
        
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
    
    // MARK: - Initializer
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
        self.addSubview(calendarView)
        setAutolayout()
    }
    
    
    // MARK: - set Autolayout()
    func setAutolayout() {
        calendarView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            calendarView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: -15),
            calendarView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 31),
            calendarView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -31),
            calendarView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -175)
        ])
    }
    
    
}


