//
//  HomeChannelCVC.swift
//  29th-iOS-Assignment
//
//  Created by 양수빈 on 2021/10/28.
//

import UIKit

class HomeChannelCVC: UICollectionViewCell {
    static let identifier = "HomeChannelCVC"
    
    @IBOutlet weak var channelImageView: UIImageView!
    @IBOutlet weak var channelNameLabel: UILabel!
    
    func setData(channelName: String, channelImage: String) {
        channelNameLabel.text = channelName
//        channelImageView.image = UIImage(named: channelImage)
        channelImageView.backgroundColor = .yellow
    }
}