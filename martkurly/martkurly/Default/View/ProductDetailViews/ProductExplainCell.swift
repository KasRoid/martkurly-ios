//
//  ProductExplainCell.swift
//  martkurly
//
//  Created by 천지운 on 2020/08/27.
//  Copyright © 2020 Team3x3. All rights reserved.
//

import UIKit

class ProductExplainCell: UICollectionViewCell {

    // MARK: - Properties

    static let identifier = "ProductExplainCell"
    private let sideInsetValue: CGFloat = 12
    private var infoViewModel = ExplainInfoViewModel()

    private let explainTableView = UITableView()

    var productDetailData: ProductDetail? {
        didSet {
            infoViewModel.productDetailData = productDetailData
            explainTableView.reloadData()
        }
    }

    // MARK: - LifeCycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        configureTableView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Helpers

    func configureUI() {
        self.backgroundColor = ColorManager.General.backGray.rawValue
        configureLayout()
    }

    func configureLayout() {
        self.addSubview(explainTableView)
        explainTableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    func configureTableView() {
        explainTableView.backgroundColor = ColorManager.General.backGray.rawValue
        explainTableView.allowsSelection = false
        explainTableView.separatorStyle = .none

        explainTableView.dataSource = self
        explainTableView.delegate = self

        explainTableView.register(ProductExplainBasicCell.self,
                                  forCellReuseIdentifier: ProductExplainBasicCell.identifier)
        explainTableView.register(ProductExplainInfoCell.self,
                                  forCellReuseIdentifier: ProductExplainInfoCell.identifier)
        explainTableView.register(ProductExplainDeliveryInfoCell.self,
                                  forCellReuseIdentifier: ProductExplainDeliveryInfoCell.identifier)
        explainTableView.register(ProductDetailCell.self,
                                  forCellReuseIdentifier: ProductDetailCell.identifier)
        explainTableView.register(ProductExplainWhyCurlyCell.self,
                                  forCellReuseIdentifier: ProductExplainWhyCurlyCell.identifier)
        explainTableView.register(ProductExplainImageCell.self,
                                  forCellReuseIdentifier: ProductExplainImageCell.identifier)
    }
}

// MARK: - UITableViewDataSource

extension ProductExplainCell: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return ExplainTableViewCase.allCases.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch ExplainTableViewCase(rawValue: section)! {
        case .productInfo:
            return infoViewModel.infomations.count
        default:
            return 1
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch ExplainTableViewCase(rawValue: indexPath.section)! {
        case .productBasic:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: ProductExplainBasicCell.identifier,
                for: indexPath) as! ProductExplainBasicCell
            cell.productDetailData = productDetailData
            return cell
        case .productInfo:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: ProductExplainInfoCell.identifier,
                for: indexPath) as! ProductExplainInfoCell

            let infomationType = infoViewModel.infomations[indexPath.row]
            cell.configure(infoTitleText: infomationType.description,
                           infoContentText: infoViewModel.requestInfoContent(type: infomationType),
                           infoSubContentText: infoViewModel.requestInfoSubContent(type: infomationType))

            return cell
        case .productDelivery:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: ProductExplainDeliveryInfoCell.identifier,
                for: indexPath) as! ProductExplainDeliveryInfoCell
            return cell
        case .productDetail:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: ProductDetailCell.identifier,
                for: indexPath) as! ProductDetailCell
            cell.productDetailData = productDetailData
            return cell
        case .productImage:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: ProductExplainImageCell.identifier,
                for: indexPath) as! ProductExplainImageCell
            let imageURL = URL(string: productDetailData?.info_img ?? "")
            cell.productImageView.kf.setImage(with: imageURL)
            return cell
        case .productWhyKurly:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: ProductExplainWhyCurlyCell.identifier,
                for: indexPath) as! ProductExplainWhyCurlyCell
            return cell
        }
    }
}

// MARK: - UITableViewDelegate

extension ProductExplainCell: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if ExplainTableViewCase.allCases.count - 1 == section {
            return 80
        }
        return .zero
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if ExplainTableViewCase.allCases.count - 1 == section {
            let view = UIView()
            view.backgroundColor = .clear
            return view
        }
        return nil
    }
}
