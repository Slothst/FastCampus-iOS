//
//  PurchaseRootView.swift
//  Cproject
//
//  Created by 최낙주 on 5/28/24.
//

import UIKit

class PurchaseRootView: UIView {
    private var scrollViewConstraints: [NSLayoutConstraint]?
    private var titleLabelConstraints: [NSLayoutConstraint]?
    private var purchaseItemStackViewConstraints: [NSLayoutConstraint]?
    private var purchaseButtonConstraints: [NSLayoutConstraint]?

    private var scrollview: UIScrollView = {
        let scrollView: UIScrollView = UIScrollView()
        scrollView.alwaysBounceVertical = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private var containerView: UIView = {
        let view: UIView = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var titleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "주문 상품 목록"
        label.font = .systemFont(ofSize: 17, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var purchaseItemStackView: UIStackView = {
        let stackView: UIStackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 7
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private var purchaseButton: UIButton = {
        let button: UIButton = UIButton()
        button.setTitle("결제하기", for: .normal)
        button.setTitleColor(.wh, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        button.layer.backgroundColor = UIColor.keyColorBlue.cgColor
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        if scrollViewConstraints == nil {
            let constraints = [
                scrollview.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
                scrollview.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
                scrollview.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
                scrollview.bottomAnchor.constraint(equalTo: purchaseButton.topAnchor),
            
                containerView.topAnchor.constraint(equalTo: scrollview.topAnchor),
                containerView.leadingAnchor.constraint(equalTo: scrollview.leadingAnchor),
                containerView.trailingAnchor.constraint(equalTo: scrollview.trailingAnchor),
                containerView.bottomAnchor.constraint(equalTo: scrollview.bottomAnchor),
                containerView.widthAnchor.constraint(equalTo: scrollview.widthAnchor)
            ]
            NSLayoutConstraint.activate(constraints)
            scrollViewConstraints = constraints
        }
        
        if titleLabelConstraints == nil, let superView = titleLabel.superview {
            let constraints = [
                titleLabel.topAnchor.constraint(equalTo: superView.topAnchor, constant: 33),
                titleLabel.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: 33),
                titleLabel.trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: -33)
            ]
            NSLayoutConstraint.activate(constraints)
            titleLabelConstraints = constraints
        }
        
        if purchaseItemStackViewConstraints == nil, let superView = purchaseItemStackView.superview {
            let constraints = [
                purchaseItemStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 19),
                purchaseItemStackView.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: 20),
                purchaseItemStackView.trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: -20),
                purchaseItemStackView.bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: -33)
            ]
            NSLayoutConstraint.activate(constraints)
            purchaseItemStackViewConstraints = constraints
        }
        
        if purchaseButtonConstraints == nil {
            let constraints = [
                purchaseButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
                purchaseButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
                purchaseButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -32),
                purchaseButton.heightAnchor.constraint(equalToConstant: 50)
            ]
            NSLayoutConstraint.activate(constraints)
            purchaseItemStackViewConstraints = constraints
        }
        
        super.updateConstraints()
    }
    
    private func commonInit() {
        addSubViews()
    }
    
    private func addSubViews() {
        self.addSubview(scrollview)
        scrollview.addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(purchaseItemStackView)
        self.addSubview(purchaseButton)
    }
    
    func setPurchaseItem(_ viewModels: [PurchaseSelectedItemViewModel]) {
        purchaseItemStackView.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
        viewModels.forEach {
            purchaseItemStackView.addArrangedSubview(PurchaseSelectedItemView(viewModel: $0))
        }
    }
}
