//
//  HomeContentTVC.swift
//  29th-iOS-Assignment
//
//  Created by 양수빈 on 2021/10/28.
//

import UIKit

class HomeContentTVC: UITableViewCell {
    static let identifier = "HomeContentTVC"

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
        contentImageView.contentMode = .scaleToFill
    }
    
    func setupLayout(){
        contentImageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(212)
        }
        
        contentChannelImageView.snp.makeConstraints {
            $0.top.equalTo(contentImageView.snp.bottom).offset(12)
            $0.leading.equalToSuperview().offset(12)
            $0.width.height.equalTo(36)
        }
        
        contentTitleLabel.snp.makeConstraints {
            $0.top.equalTo(contentImageView.snp.bottom).offset(12)
            $0.leading.equalTo(contentChannelImageView.snp.trailing).offset(12)
            $0.trailing.equalTo(contentMoreButton.snp.leading).offset(-19)
        }
        
        contentSubLabel.snp.makeConstraints {
            $0.top.equalTo(contentTitleLabel.snp.bottom).offset(4)
            $0.leading.equalTo(contentTitleLabel.snp.leading)
            $0.trailing.equalTo(contentTitleLabel.snp.trailing)
        }
        
        contentMoreButton.snp.makeConstraints { 
            $0.top.equalTo(contentImageView.snp.bottom).offset(7)
            $0.trailing.equalToSuperview()
            $0.width.height.equalTo(26)
        }
    }
}
