//
//  ViewController.swift
//  MixedUILibrariesSample
//
//  Created by 酒井文也 on 2017/12/01.
//  Copyright © 2017年 酒井文也. All rights reserved.
//

import UIKit
import FlexibleSteppedProgressBar

class MainViewController: UIViewController {

    //ステップインジケータ表示用部品のOutlet
    @IBOutlet weak var stepIndicator: FlexibleSteppedProgressBar!

    //チュートリアル用のUI部品の配置
    @IBOutlet weak var tutorialTitleLabel: UILabel!
    @IBOutlet weak var tutorialCounterLabel: UILabel!
    @IBOutlet weak var completeTutorialButton: UIButton!

    //ContainerViewにEmbedしたUIPageViewControllerのインスタンスを保持する
    fileprivate var pageViewController: UIPageViewController?

    //ページングして表示させるViewControllerを保持する配列
    fileprivate var tutorialControllerLists = [TutorialBaseViewController]()

    //チュートリアル画面に表示する要素
    private let tutorialContents: [Tutorial] = Tutorial.getSampleData()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupPageViewControllerTitle()
        setupStepIndicator()
        setupTutorialControllerLists()
        setupPageViewController()
        setupCompleteTutorialButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    //MARK: - Private Functions

    private func setupPageViewControllerTitle() {
        tutorialTitleLabel.text = "クリスマスのディナー表示サンプル"
    }

    private func setupCompleteTutorialButton() {
        completeTutorialButton.layer.cornerRadius = 5.0
        completeTutorialButton.layer.borderWidth = 0.75
        completeTutorialButton.layer.borderColor = UIColor.orange.cgColor
        completeTutorialButton.backgroundColor = UIColor.white
        completeTutorialButton.setTitleColor(UIColor.orange, for: .normal)
    }

    //ステップインジケータ表示の初期表示に関するセッティングをするメソッド
    private func setupStepIndicator() {
        stepIndicator.delegate = self

        //ステップインジケータのライン太さとステップ数を設定する
        stepIndicator.numberOfPoints = 3
        stepIndicator.lineHeight = 4
        
        //選択時の外枠を設定する
        stepIndicator.selectedOuterCircleLineWidth = 4.0
        stepIndicator.selectedOuterCircleStrokeColor = UIColor.orange
        stepIndicator.currentSelectedCenterColor = UIColor.white

        stepIndicator.stepAnimationDuration = 0.26
        stepIndicator.currentIndex = 0
    }

    //UIPageViewControllerの初期設定
    private func setupPageViewController() {

        //ContainerViewにEmbedしたUIPageViewControllerを取得する
        pageViewController = childViewControllers[0] as? UIPageViewController

        //UIPageViewControllerDelegate / UIPageViewControllerDataSourceの宣言
        pageViewController!.delegate = self
        pageViewController!.dataSource = self

        //最初に表示する画面として配列の先頭のViewControllerを設定する
        pageViewController!.setViewControllers([tutorialControllerLists[0]], direction: .forward, animated: false, completion: nil)
    }

    //Storyboard上に配置したViewController(StoryboardID = TutorialBaseViewController)をインスタンス化して配列に追加する
    private func setupTutorialControllerLists() {

        //チュートリアルコンテンツのセットアップを行う
        for index in 0..<tutorialContents.count {
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            let tutorialBaseViewController = storyboard.instantiateViewController(withIdentifier: "TutorialBaseViewController") as! TutorialBaseViewController
            
            //「タグ番号 = インデックスの値」でスワイプ完了時にどのViewControllerかを判別できるようにする ＆ チュートリアルデータをセットする
            tutorialBaseViewController.view.tag = index
            tutorialBaseViewController.setTutorialView(tutorialContents[index])

            //tutorialControllerListsに追加する
            tutorialControllerLists.append(tutorialBaseViewController)
        }
        tutorialCounterLabel.text = "1 of \(tutorialContents.count)"
    }
}

//MARK: - UIPageViewControllerDelegate, UIPageViewControllerDataSource

extension MainViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {

    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {

        //スワイプアニメーションが完了していない時には処理をさせなくする
        if !completed { return }

        //ここから先はUIPageViewControllerのスワイプアニメーション完了時に発動する
        if let targetViewControllers = pageViewController.viewControllers {
            if let targetViewController = targetViewControllers.last {

                //現在位置の表示インデクス番号を表示する
                let currentCount = targetViewController.view.tag + 1
                tutorialCounterLabel.text = "\(currentCount) of \(tutorialContents.count)"
                stepIndicator.currentIndex = targetViewController.view.tag

                //一番最後のページのみボタン押下を可能にする
                completeTutorialButton.isEnabled = (currentCount == tutorialContents.count)
            }
        }
    }

    //逆方向にページ送りした時に呼ばれるメソッド
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {

        //インデックスを取得する
        guard let index = tutorialControllerLists.index(of: viewController as! TutorialBaseViewController) else {
            return nil
        }

        //インデックスの値に応じてコンテンツを動かす
        if index <= 0 {
            return nil
        } else {
            return tutorialControllerLists[index - 1]
        }
    }

    //順方向にページ送りした時に呼ばれるメソッド
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {

        //インデックスを取得する
        guard let index = tutorialControllerLists.index(of: viewController as! TutorialBaseViewController) else {
            return nil
        }

        //インデックスの値に応じてコンテンツを動かす
        if index >= tutorialControllerLists.count - 1 {
            return nil
        } else {
            return tutorialControllerLists[index + 1]
        }
    }
}

// MARK - FlexibleSteppedProgressBarDelegate

extension MainViewController: FlexibleSteppedProgressBarDelegate {

    //ステップインジケータを選択した際に実行されるメソッド
    func progressBar(_ progressBar: FlexibleSteppedProgressBar,
                     didSelectItemAtIndex index: Int) {
        stepIndicator.currentIndex = index
    }

    //ステップインジケータを選択の選択可否を設定するメソッド
    func progressBar(_ progressBar: FlexibleSteppedProgressBar,
                     canSelectItemAtIndex index: Int) -> Bool {
        return false
    }

    //ステップインジケータに表示される文言を表示するメソッド
    func progressBar(_ progressBar: FlexibleSteppedProgressBar,
                     textAtIndex index: Int, position: FlexibleSteppedProgressBarTextLocation) -> String {
        //特に必要ない場合にはカラッポの文字列にする
        return ""
    }
}
