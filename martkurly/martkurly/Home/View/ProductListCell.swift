//
//  ProductListCell.swift
//  martkurly
//
//  Created by 천지운 on 2020/08/21.
//  Copyright © 2020 Team3x3. All rights reserved.
//

import UIKit

class ProductListCell: UICollectionViewCell {

    // MARK: - Properties

    static let identifier = "ProductListCell"

    var headerType: SortHeaderType = .notSort {
        didSet {
            productListView = ProductListView(headerType: headerType)
            configureLayout()
        }
    }
    private var productListView: ProductListView!

    // MARK: - LifeCycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Helpers

    func configureUI() {
        self.backgroundColor = .white
    }

    func configureLayout() {
        [productListView].forEach {
            self.addSubview($0)
        }

        productListView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}