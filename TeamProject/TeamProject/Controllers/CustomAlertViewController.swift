//
//  SelectionAlert.swift
//  TeamProject
//
//  Created by Sam Sung on 2023/04/04.
//

import UIKit

final class CustomAlertViewController: UIViewController {
    
    // MARK: - Properties
    lazy var customAlertView = CustomAlertView(date: baseDate)
    private var baseDate: Date
    
    
    
    // MARK: - Lifecycle
    override func loadView() {
        self.view = customAlertView
    }
    
    init(baseDate: Date) {
        self.baseDate = baseDate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAddTarget()
    }

    
// MARK: - Helpers

    private  func setAddTarget() {
        customAlertView.plusButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Actions
    
    @objc private func addButtonTapped() {
        print("얼럿창의 + 버튼 눌림")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

        self.dismiss(animated: true)
    }
    
    
    
}
