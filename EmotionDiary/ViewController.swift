//
//  ViewController.swift
//  EmotionDiary
//
//  Created by 이재희 on 1/2/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var stackView: UIStackView!
    @IBOutlet var backgroundImageView: UIImageView!
    
    var subviewList: [UIView] = []
    var labelList = [("행복해", UserDefaults.standard.integer(forKey: "0")),
                     ("좋아해", UserDefaults.standard.integer(forKey: "1")),
                     ("사랑해", UserDefaults.standard.integer(forKey: "2")), 
                     ("황당해", UserDefaults.standard.integer(forKey: "3")),
                     ("편안해", UserDefaults.standard.integer(forKey: "4")),
                     ("지루해", UserDefaults.standard.integer(forKey: "5")),
                     ("당황해", UserDefaults.standard.integer(forKey: "6")),
                     ("속상해", UserDefaults.standard.integer(forKey: "7")),
                     ("우울해", UserDefaults.standard.integer(forKey: "8"))]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "감정 다이어리"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "list.dash"), style: .plain, target: nil, action: nil)
        // TODO: alert 연결해보기
        
        backgroundImageView.image = .background
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.alpha = 0.7
        
        stackView.subviews.forEach { $0.subviews.forEach { subviewList.append($0) } }
        setupUI(subviewList)
        
    }
    
    func setupUI(_ list: [UIView]) {
        for (i, view) in list.enumerated() {
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
            
            let imageView = view.subviews[0] as! UIImageView
            imageView.image = UIImage(named: "slime\(i+1)")
            imageView.isUserInteractionEnabled = true
            imageView.addGestureRecognizer(tapGestureRecognizer)
            
            let label = view.subviews[1] as! UILabel
            label.text = "\(labelList[i].0) \(labelList[i].1)"
            label.font = .systemFont(ofSize: 14)
            label.textAlignment = .center
        }
    }
    
    @objc func imageTapped(_ sender: UITapGestureRecognizer) {
        let tag = sender.view!.tag
        let label = sender.view?.superview?.subviews[1] as! UILabel
        UserDefaults.standard.set(UserDefaults.standard.integer(forKey: "\(tag)") + 1, forKey: "\(tag)")
        label.text = "\(labelList[tag].0) \(UserDefaults.standard.integer(forKey: "\(tag)"))"
    }


}

