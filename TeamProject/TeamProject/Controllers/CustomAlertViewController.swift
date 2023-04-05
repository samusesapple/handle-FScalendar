//
//  SelectionAlert.swift
//  TeamProject
//
//  Created by Sam Sung on 2023/04/04.
//

import UIKit

class CustomAlertViewController: UIViewController {
    
    // MARK: - Properties
    let customAlertView = CustomAlertView()
    var baseDate: Date = Date()
    
    
    
    // MARK: - Lifecycle
    override func loadView() {
        self.view = customAlertView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAddTarget()
    }

    override func viewWillAppear(_ animated: Bool) {
        setDateTitle()
    }
    
    
    // MARK: - Functions for action
    func setDateTitle() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM.dd (EEE)"
        customAlertView.alertDate.text = dateFormatter.string(from: baseDate)
    }
    
    func setAddTarget() {
        customAlertView.plusButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
    }
    
    
    @objc func addButtonTapped() {
        print("얼럿창의 + 버튼 눌림")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

        self.dismiss(animated: true)
    }
    
    
    
}
