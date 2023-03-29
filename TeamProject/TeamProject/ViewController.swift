//
//  ViewController.swift
//  TeamProject
//
//  Created by Sam Sung on 2023/03/29.
//

import UIKit
import FSCalendar

class CalendarViewController: UIViewController {
    
    private let monthlyView = MonthlyView()
    
    override func loadView() {
        view = monthlyView
    }
     
    override func viewDidLoad() {
        super.viewDidLoad()
        setCalendar()
    }
    
    
    
    // MARK: - set Calendar()
    func setCalendar() {
        monthlyView.calendarView.delegate = self
        monthlyView.calendarView.dataSource = self

    }
    
    // MARK: - set Alert()
    func setAlert() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        // 얼럿창에 들어갈 액션 선택지 생성
        let diary = UIAlertAction(title: "일기", style: .default) { action in
            print("확인버튼 눌림.")
        }
        let memo = UIAlertAction(title: "메모", style: .default) { action in
            print("확인버튼 눌림.")
        }
        let cancel = UIAlertAction(title: "취소하기", style: .cancel) { [weak self] action in
            print("취소버튼 눌림.")
            self?.monthlyView.calendarView.setCurrentPage(Date(), animated: true)
        }
        
        alert.addAction(diary)
        alert.addAction(memo)
        alert.addAction(cancel)
        
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension CalendarViewController: FSCalendarDelegate, FSCalendarDataSource,  FSCalendarDelegateAppearance {
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        print(dateFormatter.string(from: date) + " 선택됨")
        setAlert()
        
    }
    
    // 오늘 날짜에만 '오늘' 글씨 표시
    func calendar(_ calendar: FSCalendar, subtitleFor date: Date) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        switch dateFormatter.string(from: date) {
        case dateFormatter.string(from: Date()):
            return "오늘"
        default:
            return nil
        }
    }
    
    
}

