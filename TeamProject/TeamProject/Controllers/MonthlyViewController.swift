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

class MonthlyViewController: UIViewController, UINavigationControllerDelegate {
    private let monthlyView = MonthlyView()
    
    weak var delegate: MonthlyViewControllerDelegate?
    
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
        setNavigationBar()
    }
    
    // MARK: - set NavigationBar()
    func setNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()  // 투명으로
        
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        let menu = UIBarButtonItem(image: UIImage(systemName: "text.justify"), style: .done, target: self, action: #selector(menuTapped))
        navigationItem.rightBarButtonItem = menu
    }
    

    
    // MARK: - Functions for action
    @objc func menuTapped() {
        print("메뉴 버튼 눌림")
        delegate?.didTapMenuButton()
    }
    
    func setAlert() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
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
    
    func setCustomAlert(date: Date) {
            let customAlert = CustomAlertViewController()
        customAlert.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        customAlert.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        customAlert.baseDate = date
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
    
    
}

