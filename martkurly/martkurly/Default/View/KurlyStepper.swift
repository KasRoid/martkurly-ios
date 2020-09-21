//
//  KurlyStepper.swift
//  martkurly
//
//  Created by Kas Song on 9/17/20.
//  Copyright © 2020 Team3x3. All rights reserved.
//

import UIKit

class KurlyStepper: UIView {

    // MARK: - Properties
    let subtractButton = UIButton().then {
        let image = UIImage(systemName: "minus")?.withTintColor(.martkurlyMainPurpleColor, renderingMode: .alwaysOriginal).withConfiguration(UIImage.SymbolConfiguration(weight: .thin))
        $0.setImage(image, for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.textAlignment = .center
        $0.backgroundColor = .backgroundGray
    }

    let addButton = UIButton().then {
        let image = UIImage(systemName: "plus")?.withTintColor(.martkurlyMainPurpleColor, renderingMode: .alwaysOriginal).withConfiguration(UIImage.SymbolConfiguration(weight: .thin))
        $0.setImage(image, for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.textAlignment = .center
        $0.backgroundColor = .backgroundGray
    }

    let countLabel = UILabel().then {
        $0.text = "0"
        $0.font = UIFont.systemFont(ofSize: 16, weight: .light)
        $0.textAlignment = .center
        $0.backgroundColor = .white
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.stepperBorderGray.cgColor
    }

    var productCounts = 0 {
        willSet { countLabel.text = String(newValue) }
    }

    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UI
    private func configureUI() {
        self.layer.cornerRadius = 4
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.stepperBorderGray.cgColor
        self.clipsToBounds = true
        setContraints()
    }

    private func setContraints() {
        [subtractButton, countLabel, addButton].forEach {
            self.addSubview($0)
        }
        subtractButton.snp.makeConstraints {
            $0.top.leading.bottom.equalToSuperview()
            $0.height.equalTo(33)
            $0.width.equalTo(35)
        }
        countLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(subtractButton.snp.trailing)
            $0.height.equalTo(subtractButton)
            $0.width.equalTo(51)
        }
        addButton.snp.makeConstraints {
            $0.top.trailing.bottom.equalToSuperview()
            $0.leading.equalTo(countLabel.snp.trailing)
            $0.height.equalTo(subtractButton)
            $0.width.equalTo(subtractButton)
        }
    }
}
