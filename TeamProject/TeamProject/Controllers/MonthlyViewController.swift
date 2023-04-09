//
//  ViewController.swift
//  TeamProject
//
//  Created by Sam Sung on 2023/03/29.
//

import UIKit
import FSCalendar

protocol MonthlyViewControllerDelegate: AnyObject {
    func didTapMenuButton()
}

final class MonthlyViewController: UIViewController, UINavigationControllerDelegate {
    
    let topStackView = MonthlyNavigationStackView()
    private let calendarView = CalendarView()
    
    weak var delegate: MonthlyViewControllerDelegate?
    
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setCalendar()
        setMenuButtonAction()
    }
    
    
    // MARK: - Helper
    private func configureUI() {
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        
        let mainStack = UIStackView(arrangedSubviews: [topStackView, calendarView])
        mainStack.axis = .vertical
        
        view.addSubview(mainStack)
        
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([mainStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor), mainStack.bottomAnchor.constraint(equalTo: view.bottomAnchor), mainStack.leadingAnchor.constraint(equalTo: view.leadingAnchor), mainStack.trailingAnchor.constraint(equalTo: view.trailingAnchor)])
        mainStack.isLayoutMarginsRelativeArrangement = true
        mainStack.layoutMargins = .init(top: 0, left: 0, bottom: 0, right: 0)
        mainStack.bringSubviewToFront(topStackView)
    }
    
    private func setCalendar() {
        calendarView.calendarView.delegate = self
        calendarView.calendarView.dataSource = self
    }
    
    
    private func setMenuButtonAction() {
        topStackView.menuButton.addTarget(self, action: #selector(menuTapped), for: .touchUpInside)
    }

    
    // MARK: - Actions
    @objc private func menuTapped() {
        print("메뉴 버튼 눌림")
        delegate?.didTapMenuButton()
    }
    
    private func setAlert() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let diary = UIAlertAction(title: "일기", style: .default) { action in
            print("확인버튼 눌림.")
        }
        let memo = UIAlertAction(title: "메모", style: .default) { action in
            print("확인버튼 눌림.")
        }
        let cancel = UIAlertAction(title: "취소하기", style: .cancel) { [weak self] action in
            print("취소버튼 눌림.")
            self?.calendarView.calendarView.setCurrentPage(Date(), animated: true)
        }
        alert.addAction(diary)
        alert.addAction(memo)
        alert.addAction(cancel)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    private func setCustomAlert(date: Date) {
            let customAlert = CustomAlertViewController(baseDate: date)
        customAlert.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        customAlert.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
            self.present(customAlert, animated: true, completion: nil)
        }
    
}

extension MonthlyViewController: FSCalendarDelegate, FSCalendarDataSource,  FSCalendarDelegateAppearance {
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        print(dateFormatter.string(from: date) + " 선택됨")
        // 오늘 날짜 선택되지 않은 경우에만 alert 띄우기
        if dateFormatter.string(from: date) == dateFormatter.string(from: Date()) {
            print("오늘 선택됨")
            setCustomAlert(date: date)
        } else {
            setAlert()
        }
    }
    
    // 오늘 날짜에만 '오늘' 표시
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
    
    // 캘린더 넘길 때마다, navigationBar의 연도.월 바꾸기
    func calendarCurrentPageDidChange(_ calendar: FSCalendar) {
        let currentDate = calendarView.calendarView.currentPage
        topStackView.baseDate = currentDate
    }
    
//    func calendar(_ calendar: FSCalendar, imageFor date: Date) -> UIImage? {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd"
//        let dateString = dateFormatter.string(from: date)
//        let eventImage = UIImage(systemName: "circle.fill")?.withTintColor(UIColor(named: "subPurpleColor")!)
//        print("date : \(dateString)")
//        return scheduleDateArray.contains(dateString) ? eventImage : nil
//        }
//    
}

