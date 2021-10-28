//
//  CategoryCVC.swift
//  29th-iOS-Assignment
//
//  Created by 양수빈 on 2021/10/28.
//

import UIKit

import SnapKit

class CategoryCVC: UICollectionViewCell {
    static let identifier = "CategoryCVC"
    
    let categoryLabel = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configUI()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
    func configUI() {
        layer.cornerRadius = 14
        layer.borderWidth = 1
        layer.borderColor = .init(gray: 125/235, alpha: 0.5)
        backgroundColor = .systemGray6
        
        categoryLabel.textAlignment = .center
        categoryLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    }
    
    func setupLayout() {
        self.addSubview(categoryLabel)
        
        categoryLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
