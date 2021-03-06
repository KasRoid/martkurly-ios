//
//  SignInVC.swift
//  martkurly
//
//  Created by Doyoung Song on 8/20/20.
//  Copyright © 2020 Team3x3. All rights reserved.
//

import UIKit

class SignInVC: UIViewController {

    // MARK: - Properties
    private lazy var topBar = CustomNavigationBarView(title: StringManager.Sign.login.rawValue, viewController: self)
    private let idTextField = UserTextFieldView(placeholder: StringManager.Sign.idTextField.rawValue, fontSize: 15)
    private let pwTextField = UserTextFieldView(placeholder: StringManager.Sign.pwTextField.rawValue, fontSize: 15).then {
        $0.textField.isSecureTextEntry = true
    }
    private let loginButton = KurlyButton(title: StringManager.Sign.login.rawValue, style: .purple)

    private let forgotIDButton = UIButton().then {
        $0.setTitle(StringManager.Sign.forgotID.rawValue, for: .normal)
        $0.setTitleColor(ColorManager.General.mainGray.rawValue, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14)
    }
    private let forgotPWButton = UIButton().then {
        $0.setTitle(StringManager.Sign.forgotPW.rawValue, for: .normal)
        $0.setTitleColor(ColorManager.General.mainGray.rawValue, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14)
    }
    private let verticalSeparator = UIView().then {
        $0.backgroundColor = ColorManager.General.mainGray.rawValue
    }

    private let signUpButton = KurlyButton(title: StringManager.Sign.signUp.rawValue, style: .white)
    private let warning = IncorrectInputWarningView(title: "")

    private var isValid = false

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigationBarStatus(type: .whiteType, isShowCart: false, leftBarbuttonStyle: .dismiss, titleText: "로그인")
    }

    // MARK: - UI
    private func configureUI() {
        setPropertyAttributes()
        setConstraints()
    }

    private func setNavigationBar() {
        navigationController?.navigationBar.isHidden = true
    }

    private func setPropertyAttributes() {
        [loginButton, forgotIDButton, forgotPWButton, signUpButton].forEach {
            $0.addTarget(self, action: #selector(handleButtons(_:)), for: .touchUpInside)
        }
    }

    private func setConstraints() {
        [idTextField, pwTextField, loginButton, verticalSeparator, forgotIDButton, forgotPWButton, signUpButton].forEach {
            view.addSubview($0)
        }
        idTextField.snp.makeConstraints {
            $0.top.equalToSuperview().offset(35)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        pwTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(12)
            $0.leading.trailing.equalTo(idTextField)
            $0.height.equalTo(idTextField)
        }
        loginButton.snp.makeConstraints {
            $0.top.equalTo(pwTextField.snp.bottom).offset(20)
            $0.leading.trailing.equalTo(idTextField)
            $0.height.equalTo(idTextField)
        }
        verticalSeparator.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(1)
            $0.height.equalTo(12)
        }
        forgotIDButton.snp.makeConstraints {
            $0.trailing.equalTo(verticalSeparator.snp.leading).offset(-10)
            $0.centerY.equalTo(verticalSeparator)
        }
        forgotPWButton.snp.makeConstraints {
            $0.leading.equalTo(verticalSeparator.snp.trailing).offset(10)
            $0.centerY.equalTo(verticalSeparator)
        }
        signUpButton.snp.makeConstraints {
            $0.top.equalTo(verticalSeparator.snp.bottom).offset(52)
            $0.leading.trailing.equalTo(idTextField)
            $0.height.equalTo(idTextField)
        }

        view.addSubview(warning)
        warning.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(-130)
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.height.equalTo(60)
        }
    }

    private func checkTextFieldValidity() {
        if idTextField.text?.isEmpty == true {
            warning.setText(text: SignError.idFieldEmpty.rawValue)
            animateWarning()
        } else if pwTextField.text?.isEmpty == true {
            warning.setText(text: SignError.pwFieldEmpty.rawValue)
            animateWarning()
        }
    }

    private func animateWarning() {
        warning.isHidden = false
        UIView.animate(
            withDuration: 0.1,
            delay: 0,
            animations: {
                self.warning.snp.updateConstraints {
                    $0.top.equalTo(self.view.safeAreaLayoutGuide)
                }
                self.view.layoutIfNeeded()
        }, completion: { _ in
            UIView.animate(
                withDuration: 0.4,
                delay: 1.5,
                animations: {
                    self.warning.snp.updateConstraints {
                        $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(-130)
                    }
                    self.view.layoutIfNeeded()
            }, completion: { _ in return self.warning.isHidden = true })
        })
    }

    // MARK: - Selectors
    @objc
    private func handleButtons(_ sender: UIButton) {
        switch sender {
        case loginButton:
            //            isValid = false
            checkTextFieldValidity()

            let username = idTextField.text!
            let password = pwTextField.text!

            KurlyService.shared.signIn(username: username, password: password, completionHandler: loginProcessHandler(result:data:))
        case forgotIDButton:
            let nextVC = ForgotIDVC()
            navigationController?.pushViewController(nextVC, animated: true)
        case forgotPWButton:
            let nextVC = ForgotPWVC()
            navigationController?.pushViewController(nextVC, animated: true)
        case signUpButton:
            let nextVC = SignUpVC()
            navigationController?.pushViewController(nextVC, animated: true)
        default:
            return
        }
    }

    // MARK: - Helpers
    private func loginProcessHandler(result: Bool, data: LoginData?) {
        switch result {
        case true:
            guard let data = data else { return }
            let token = data.token
            let userData = data.user

            let id = userData.id
            let username = userData.username
            let email = userData.email
            let phone = userData.phone
            let nickname = userData.nickname
            let gender = userData.gender

            let user: [String: Any] = [
                "id": id,
                "username": username,
                "email": email,
                "phone": phone,
                "nickname": nickname,
                "gender": gender
            ]

            print("Debug: ", user)

            UserDefaults.standard.set(token, forKey: "token")
            UserDefaults.standard.set(user, forKey: "user")
            UserService.shared.loadData()
            print("Login Success")
            self.dismiss(animated: true, completion: nil)
        case false:
            print("Login Failed")
        }
    }
}
