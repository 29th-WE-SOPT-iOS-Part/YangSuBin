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
    var channelNameList = ["iOS", "android", "web", "design",
                           "plan", "catch", "me", "hello"]
    var channelImageList = ["ggamju1", "ggamju2", "ggamju3",
                            "ggamju4", "ggamju5", "ggamju6",
                            "ggamju7", "ggamju8"]
    var contentTitleList = ["1주차 iOS: 치킨 시켜먹는법", "2주차 iOS: 떡볶이는 지상 최고의 음식입니다",
                            "3주차 iOS: 떡볶이 사주세요 매운거로 사주세요",
                            "4주차 iOS: 오늘은 엽떡을 먹을까 응떡을 먹을까 신전을 먹을까?",
                            "5주차 iOS: 육회스터디 서치바 정리해서 올려야되는데",
                            "6주차 iOS: 자료구조 시험 망하는 법"]
    var contentImageList = ["congi1", "congi2", "congi3", "congi4", "congi5", "congi6"]
    var categorieList = ["전체", "오늘", "이어서 시청하기", "시청하지 않음", "실시간", "게시물"]
    
    // MARK: - Properties
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var windowButton: UIButton!
    @IBOutlet weak var notiButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var profileButton: UIButton!
    
    @IBOutlet weak var dividedLine: UIView!
    @IBOutlet weak var channelCollectionView: UICollectionView!
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    @IBOutlet weak var contentTableView: UITableView!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        channelCollectionView.delegate = self
        channelCollectionView.dataSource = self
        categoriesCollectionView.delegate = self
        categoriesCollectionView.dataSource = self
        contentTableView.delegate = self
        contentTableView.dataSource = self

        configUI()
        setupLayout()
        registerXib()
        registerNib()
    }

    // MARK: - Custom Method
    func configUI() {
        logoImageView.image = UIImage(named: "premiumLogo")
        windowButton.setImage(UIImage(named: "windowSharingIcon"), for: .normal)
        notiButton.setImage(UIImage(named: "notificationIcon"), for: .normal)
        searchButton.setImage(UIImage(named: "SearchIcon"), for: .normal)
        profileButton.setImage(UIImage(named: "wesoptProfile"), for: .normal)
        
        channelCollectionView.showsHorizontalScrollIndicator = false
        categoriesCollectionView.showsHorizontalScrollIndicator = false
    }
    
    func registerXib() {
        let xibName = UINib(nibName: ContentTVC.identifier, bundle: nil)
        contentTableView.register(xibName, forCellReuseIdentifier: ContentTVC.identifier)
    }
    
    func registerNib() {
        categoriesCollectionView.register(CategoryCVC.self, forCellWithReuseIdentifier: CategoryCVC.identifier)
    }
}

// MARK: - Layout
extension HomeVC {
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
        
        dividedLine.snp.makeConstraints { make in
            make.top.equalTo(channelCollectionView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
        
        categoriesCollectionView.snp.makeConstraints { make in
            make.top.equalTo(channelCollectionView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(48)
        }
        
        contentTableView.snp.makeConstraints { make in
            make.top.equalTo(categoriesCollectionView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    /// categoriesCollectionView에 들어갈 label의 크기를 categoryLabel이라는 임의의 label을 만들어서 계산 후 return
    func setupLabelSize(index: Int) -> CGSize {
        let categoryLabel = UILabel()
        categoryLabel.text = categorieList[index]
        categoryLabel.sizeToFit()

        return categoryLabel.bounds.size
    }
}

// MARK: - UICollectionViewDelegate
extension HomeVC: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDelegateFlowLayout
extension HomeVC: UICollectionViewDelegateFlowLayout {
    /// 셀 크기 지정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch collectionView {
        case channelCollectionView :
            return CGSize(width: 72, height: 104)
            
        case categoriesCollectionView:
            let size = setupLabelSize(index: indexPath.row)
            return CGSize(width: size.width + 20, height: 30)
            
        default:
            return CGSize(width: 72, height: 104)
        }
    }
    
    /// collectionView의 padding 값 지정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        switch collectionView {
        case channelCollectionView:
            return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
            
        case categoriesCollectionView:
            return UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
            
        default:
            return .zero
        }
    }
    
    /// cell 상하 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    /// cell 좌우 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        switch collectionView {
        case channelCollectionView:
            return 0
            
        case categoriesCollectionView:
            return 9
            
        default:
            return .zero
        }
    }
}

// MARK: - UICollectionViewDataSource
extension HomeVC: UICollectionViewDataSource {
    /// cell 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView {
        case channelCollectionView :
            return channelNameList.count
            
        case categoriesCollectionView:
            return categorieList.count
        
        default:
            return 0
        }
    }
    
    /// cell 생성
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case channelCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeChannelCVC.identifier, for: indexPath) as? HomeChannelCVC else {return UICollectionViewCell()}
            cell.setData(channelName: channelNameList[indexPath.row], channelImage: channelImageList[indexPath.row])
            return cell
            
        case categoriesCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCVC.identifier, for: indexPath) as? CategoryCVC else {return UICollectionViewCell()}
            cell.categoryLabel.text = categorieList[indexPath.row]
            return cell
            
        default:
            return UICollectionViewCell()
        }
    }
}

// MARK: - UITableViewDelegate
extension HomeVC: UITableViewDelegate {
    /// tableView cell 높이
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 306
    }
}

// MARK: - UITableViewDataSource
extension HomeVC: UITableViewDataSource {
    /// cell 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentTitleList.count
    }
    
    /// cell 생성
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ContentTVC.identifier) as? ContentTVC else {return UITableViewCell()}
        
        cell.contentTitleLabel.text = contentTitleList[indexPath.row]
        cell.contentImageView.image = UIImage(named: "\(contentImageList[indexPath.row])")
        cell.contentChannelImageView.image = UIImage(named: "wesoptProfile")
        cell.contentMoreButton.setImage(UIImage(named: "moreMenuIcon"), for: .normal)
        
        return cell
    }
}
