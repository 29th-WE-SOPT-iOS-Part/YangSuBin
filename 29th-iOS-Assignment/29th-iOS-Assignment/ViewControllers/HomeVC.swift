//
//  HomeVC.swift
//  29th-iOS-Assignment
//
//  Created by 양수빈 on 2021/10/13.
//

import UIKit

import SnapKit

class HomeVC: UIViewController {
    // MARK: - Dummy Data
    var channelNameList = ["iOS", "android", "web", "design", "plan", "catch", "me", "hello"]
    var channelImageList = ["ggamju1", "ggamju2", "ggamju3", "ggamju4", "ggamju5", "ggamju6", "ggamju7", "ggamju8"]
    var contentTitleList = ["1주차 iOS: 치킨 시켜먹는법", "2주차 iOS: 떡볶이는 지상 최고의 음식입니다", "3주차 iOS: 떡볶이 사주세요 매운거로 사주세요",
                            "4주차 iOS: 오늘은 엽떡을 먹을까 응떡을 먹을까 신전을 먹을까?", "5주차 iOS: 육회스터디 서치바 정리해서 올려야되는데",
                            "6주차 iOS: 자료구조 시험 망하는 법"]
    
    // MARK: - Properties
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var windowButton: UIButton!
    @IBOutlet weak var notiButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var profileButton: UIButton!
    
    @IBOutlet weak var channelCollectionView: UICollectionView!
    @IBOutlet weak var contentTableView: UITableView!
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        channelCollectionView.delegate = self
        channelCollectionView.dataSource = self
        
        contentTableView.delegate = self
        contentTableView.dataSource = self

        configUI()
        setupLayout()
        registerXib()
    }

    // MARK: - Custom Method
    func configUI() {
        view.backgroundColor = .white
        
        logoImageView.image = UIImage(named: "premiumLogo")
        windowButton.setImage(UIImage(named: "windowSharingIcon"), for: .normal)
        notiButton.setImage(UIImage(named: "notificationIcon"), for: .normal)
        searchButton.setImage(UIImage(named: "SearchIcon"), for: .normal)
        profileButton.setImage(UIImage(named: "wesoptProfile"), for: .normal)
        
        channelCollectionView.showsHorizontalScrollIndicator = false
    }
    
    func registerXib(){
        let xibName = UINib(nibName: ContentTVC.identifier, bundle: nil)
        contentTableView.register(xibName, forCellReuseIdentifier: ContentTVC.identifier)
    }
    
    func setupLayout() {
        topView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(50)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(60)
        }
        
        logoImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(16)
            make.height.equalTo(20)
        }
        
        profileButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(16)
            make.width.height.equalTo(32)
        }
        
        searchButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalTo(profileButton.snp.leading).offset(-17)
            make.width.height.equalTo(32)
        }
        
        notiButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalTo(searchButton.snp.leading).offset(-11)
            make.width.height.equalTo(32)
        }
        
        windowButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalTo(notiButton.snp.leading).offset(-12)
            make.width.height.equalTo(32)
        }
        
        channelCollectionView.snp.makeConstraints { make in
            make.top.equalTo(topView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(104)
        }
        
        contentTableView.snp.makeConstraints { make in
            make.top.equalTo(channelCollectionView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }

}

extension HomeVC: UICollectionViewDelegate {
    
}

extension HomeVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 72, height: 104)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension HomeVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return channelNameList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeChannelCVC.identifier, for: indexPath) as? HomeChannelCVC else {return UICollectionViewCell()}
        
        cell.setData(channelName: channelNameList[indexPath.row], channelImage: channelImageList[indexPath.row])
        
        return cell
    }
}

extension HomeVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 306
    }
}

extension HomeVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentTitleList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ContentTVC.identifier) as? ContentTVC else {return UITableViewCell()}
        
        cell.contentTitleLabel.text = contentTitleList[indexPath.row]
        cell.contentImageView.image = UIImage(named: "congi")
        cell.contentChannelImageView.image = UIImage(named: "wesoptProfile")
        cell.contentMoreButton.setImage(UIImage(named: "moreMenuIcon"), for: .normal)
        return cell
    }
}
