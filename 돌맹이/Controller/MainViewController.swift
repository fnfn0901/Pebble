//
//  MainViewController.swift
//  돌맹이
//
//  Created by 신호연 on 7/18/24.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var stoneImageView: UIImageView!
    @IBOutlet weak var editIconImageView: UIImageView!
    @IBOutlet weak var waterButton: UIButton!
    @IBOutlet weak var heartButton: UIButton!
    @IBOutlet weak var starButton: UIButton!

    var user: User = User(name: "돌맹이")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 사용자 이름 설정
        nameLabel.text = user.name
        
        // 돌 이미지 설정
        stoneImageView.image = UIImage(named: "stoneImage") // 스토리보드 또는 Assets.xcassets에서 설정
        
        // 연필 아이콘 설정
        editIconImageView.image = UIImage(systemName: "pencil")
        editIconImageView.contentMode = .scaleAspectFit
        
        // 버튼 이미지 설정
        waterButton.setImage(UIImage(systemName: "drop.fill"), for: .normal)
        heartButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        starButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        
        // 버튼 배경색 설정 (스토리보드에서 설정 가능)
        waterButton.backgroundColor = UIColor.systemBlue
        heartButton.backgroundColor = UIColor.systemPink
        starButton.backgroundColor = UIColor.systemYellow
        
        // 버튼 모양 설정
        waterButton.layer.cornerRadius = waterButton.frame.size.width / 2
        heartButton.layer.cornerRadius = heartButton.frame.size.width / 2
        starButton.layer.cornerRadius = starButton.frame.size.width / 2
    }
    
    @IBAction func waterButtonTapped(_ sender: UIButton) {
        // 물 버튼 클릭 시 동작
    }
    
    @IBAction func heartButtonTapped(_ sender: UIButton) {
        // 하트 버튼 클릭 시 동작
    }
    
    @IBAction func starButtonTapped(_ sender: UIButton) {
        // 별 버튼 클릭 시 동작
    }
}

