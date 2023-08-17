//
//  LoginViewController.swift
//  TopCariving
//
//  Created by 조승기 on 2023/08/17.
//

import Combine
import UIKit

class LoginViewController: UIViewController {
    // MARK: - UI properties
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.automaticallyAdjustsScrollIndicatorInsets = false
        return scrollView
    }()
    private let logoImageView: UIImageView = {
        let screenWidth = UIScreen.main.bounds.width
        let imageView = UIImageView(image: UIImage(named: "hyundaiLogo")?.resized(to: screenWidth * 0.5))
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    private let idLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setFont(to: .init(name: .bold, size: ._18))
        label.text = "ID"
        return label
    }()
    private let idTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.leftView = UIView(frame: .init(x: 0, y: 0, width: 10, height: 40))
        textField.leftViewMode = .always
        textField.placeholder = "아이디를 입력해주세요"
        textField.font = .designSystem(.init(name: .medium, size: ._16))
        textField.backgroundColor = .hyundaiPrimaryBlue.withAlphaComponent(0.1)
        textField.layer.cornerRadius = 8
        return textField
    }()
    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setFont(to: .init(name: .bold, size: ._16))
        label.text = "PW"
        return label
    }()
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.leftView = UIView(frame: .init(x: 0, y: 0, width: 10, height: 40))
        textField.leftViewMode = .always
        textField.placeholder = "비밀번호를 입력해주세요"
        textField.font = .designSystem(.init(name: .medium, size: ._16))
        textField.backgroundColor = .hyundaiPrimaryBlue.withAlphaComponent(0.1)
        textField.layer.cornerRadius = 8
        textField.isSecureTextEntry = true
        return textField
    }()
    private let loginButton: CTAButton = {
        let button = CTAButton()
        button.setTitle(to: "로그인")
        return button
    }()
    // MARK: - Properties
    private var bag = Set<AnyCancellable>()
    private var scrollViewHeightConstraint: NSLayoutConstraint?
    
    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setEvent()
    }
    // MARK: - Helpers
    private func setUI() {
        view.backgroundColor = .white
        view.addSubview(scrollView)
        [logoImageView, idLabel, idTextField, passwordLabel, passwordTextField, loginButton].forEach {
            scrollView.addSubview($0)
        }
    }
    private func setLayout() {
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        scrollViewHeightConstraint = scrollView.heightAnchor.constraint(equalTo: view.heightAnchor)
        scrollViewHeightConstraint?.isActive = true
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.contentLayoutGuide.widthAnchor.constraint(equalTo: view.widthAnchor),
            
            logoImageView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor,
                                               constant: 100 * view.frame.height / 852),
            logoImageView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor, constant: 16),
            logoImageView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor,
                                                    constant: -16),
            
            
            idLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 20),
            idLabel.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor, constant: 20),
            idLabel.widthAnchor.constraint(equalToConstant: 30),
            idLabel.heightAnchor.constraint(equalToConstant: 30),
            
            idTextField.topAnchor.constraint(equalTo: idLabel.bottomAnchor),
            idTextField.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor, constant: 20),
            idTextField.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor, constant: -20),
            idTextField.heightAnchor.constraint(equalToConstant: 40),
            
            passwordLabel.topAnchor.constraint(equalTo: idTextField.bottomAnchor, constant: 20),
            passwordLabel.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor, constant: 20),
            passwordLabel.widthAnchor.constraint(equalToConstant: 30),
            passwordLabel.heightAnchor.constraint(equalToConstant: 30),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor),
            passwordTextField.leadingAnchor.constraint(
                equalTo: scrollView.contentLayoutGuide.leadingAnchor,
                constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor, constant: -20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            
            loginButton.bottomAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 50),
            loginButton.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor, constant: 20),
            loginButton.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor, constant: -20),
            loginButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    private func setEvent() {
        loginButton.tapPublisher()
            .map { [weak self] _ -> (String?, String?) in
                guard let self else { return ("", "") }
                return (self.idTextField.text, self.passwordTextField.text)
            }
            .sink(receiveValue: {
                print($0)
                self.view.endEditing(true)
            })
            .store(in: &bag)
        
        scrollView.tabPublisher.sink(receiveValue: { [weak self] _ in
            guard let self else { return }
            view.endEditing(true)
        })
        .store(in: &bag)
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow(_:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide(_:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    @objc private func keyboardWillShow(_ notification: Notification) {
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey]
                as? NSValue else { return }
        let keyboardHeight = keyboardFrame.cgRectValue.height
        scrollViewHeightConstraint?.constant += keyboardHeight
    }
    @objc private func keyboardWillHide(_ notification: Notification) {
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey]
                as? NSValue else { return }
        let keyboardHeight = keyboardFrame.cgRectValue.height
        scrollViewHeightConstraint?.constant -= keyboardHeight
    }
}
