//
//  ContentTVC.swift
//  29th-iOS-Assignment
//
//  Created by 양수빈 on 2021/10/28.
//

import UIKit

class ContentTVC: UITableViewCell {
    static let identifier = "ContentTVC"

    // MARK: - @IBOutlet
    @IBOutlet weak var contentImageView: UIImageView!
    @IBOutlet weak var contentChannelImageView: UIImageView!
    @IBOutlet weak var contentTitleLabel: UILabel!
    @IBOutlet weak var contentSubLabel: UILabel!
    @IBOutlet weak var contentMoreButton: UIButton!
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configUI()
        setupLayout()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Custom Method
    func configUI() {
        contentTitleLabel.numberOfLines = 2
        contentTitleLabel.text = "4차 iOS 세미나: 라이브러리 사용과 함께 치킨 먹는 방법"
        contentSubLabel.text = "WE SOPT · 조회수 100만회 · 3주전"
        contentImageView.contentMode = .scaleToFill
    }
    
    func setupLayout(){
        contentImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(212)
        }
        
        contentChannelImageView.snp.makeConstraints { make in
            make.top.equalTo(contentImageView.snp.bottom).offset(12)
            make.leading.equalToSuperview().offset(12)
            make.width.height.equalTo(36)
        }
        
        contentTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(contentImageView.snp.bottom).offset(12)
            make.leading.equalTo(contentChannelImageView.snp.trailing).offset(12)
            make.trailing.equalTo(contentMoreButton.snp.leading).offset(-19)
        }
        
        contentSubLabel.snp.makeConstraints { make in
            make.top.equalTo(contentTitleLabel.snp.bottom).offset(4)
            make.leading.equalTo(contentTitleLabel.snp.leading)
            make.trailing.equalTo(contentTitleLabel.snp.trailing)
        }
        
        contentMoreButton.snp.makeConstraints { make in
            make.top.equalTo(contentImageView.snp.bottom).offset(7)
            make.trailing.equalToSuperview()
            make.width.height.equalTo(26)
        }
    }
}
