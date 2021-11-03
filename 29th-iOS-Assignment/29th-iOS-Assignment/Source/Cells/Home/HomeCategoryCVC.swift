//
//  HomeCategoryCVC.swift
//  29th-iOS-Assignment
//
//  Created by 양수빈 on 2021/10/28.
//

import UIKit

import SnapKit

class HomeCategoryCVC: UICollectionViewCell {
    static let identifier = "HomeCategoryCVC"
    
    // MARK: - Properties
    let categoryLabel = UILabel()
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    /// 코드베이스로 cell을 생성할때 필요한 초기화 함수 (인터페이스 빌더에서는 자동으로 초기화하기 때문에 init 필요 X)
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
    
    // MARK: - Custom Method
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
        
        categoryLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
