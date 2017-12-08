//
//  TutorialBaseViewController.swift
//  MixedUILibrariesSample
//
//  Created by 酒井文也 on 2017/12/04.
//  Copyright © 2017年 酒井文也. All rights reserved.
//

import UIKit

class TutorialBaseViewController: UIViewController {

    //UI部品の配置
    @IBOutlet weak private var tutorialBaseTitleLabel: UILabel!
    @IBOutlet weak private var tutorialBaseImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTutorialBaseViewController()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    //MARK: - Function

    func setTutorialView(_ tutorial: Tutorial) {
        tutorialBaseTitleLabel.text = tutorial.title
        tutorialBaseImageView.image = tutorial.thumbnail
    }

    //MARK: - Private Function
    
    private func setupTutorialBaseViewController() {
        
        //背景に影をつける
        tutorialBaseImageView.layer.shadowRadius = 5
        tutorialBaseImageView.layer.shadowOpacity = 0.2
        tutorialBaseImageView.layer.shadowOffset = CGSize(width: 0, height: 1)
        tutorialBaseImageView.layer.shadowColor = UIColor.black.cgColor
        tutorialBaseImageView.layer.masksToBounds = false
    }
}
