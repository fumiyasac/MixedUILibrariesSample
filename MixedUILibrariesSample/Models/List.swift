//
//  List.swift
//  MixedUILibrariesSample
//
//  Created by 酒井文也 on 2017/12/08.
//  Copyright © 2017年 酒井文也. All rights reserved.
//

import Foundation
import UIKit

struct List {
    
    //メンバ変数（ダミーデータを作成する）
    let id: Int
    let title: String
    let thumbnail: UIImage
    let star: Double
    let category: String
    let publishedDate: String
    let descriptionText: String
    
    //イニシャライザ
    init(id: Int, title: String, thumbnail: UIImage, star: Double, category: String, publishedDate: String, descriptionText: String) {
        self.id              = id
        self.title           = title
        self.thumbnail       = thumbnail
        self.star            = star
        self.category        = category
        self.publishedDate   = publishedDate
        self.descriptionText = descriptionText
    }
    
    static func getSampleData() -> [List] {
        return [
            List(
                id: 1,
                title: "身も心も温まれるクリームシチュー",
                thumbnail: UIImage.init(named: "cream_stew")!,
                star: 4.4,
                category: "家庭でも作れる & 子供が喜ぶ",
                publishedDate: "2017.12.09",
                descriptionText: "クリスマスイブに人気の料理の一つのクリームシチュー。具材も定番のチキンから豪華絢爛な魚介類をふんだんに使ったものに加えて、お野菜の色どりも幅広く対応できるのがとっても嬉しいですよね。"
            ),
            List(
                id: 2,
                title: "おかわりしたくなる手作りハンバーグカレー",
                thumbnail: UIImage.init(named: "hamburg_curry")!,
                star: 3.6,
                category: "家庭でも作れる & 子供が喜ぶ",
                publishedDate: "2017.12.09",
                descriptionText: "ハンバーグもカレーライスもどっちも男の子なら大好物のはず。ハンバーグに使うのはもちろん牛肉100%でしっかりと仕込んでおいて、上にかけるカレーも玉ねぎがあめ色になるまで十分に炒めるのがポイントです。"
            ),
            List(
                id: 3,
                title: "愛情たっぷりふわふわオムライス",
                thumbnail: UIImage.init(named: "om_rice")!,
                star: 4.0,
                category: "家庭でも作れる & 彼氏が喜ぶ",
                publishedDate: "2017.12.09",
                descriptionText: "具沢山のケチャップライスの上にはもちろん、半熟状態のふわとろのオムレツを乗せたふわふわのオムライスならきっと彼氏の胃袋とハートをがっちりとキャッチすることは間違いなしです。"
            ),
            List(
                id: 4,
                title: "熱々で具沢山のグラタン",
                thumbnail: UIImage.init(named: "gratan")!,
                star: 4.4,
                category: "子供が喜ぶ & 彼氏が喜ぶ",
                publishedDate: "2017.12.09",
                descriptionText: "寒い冬の季節にはぴったりの熱々のグラタン。具のレパートリーも「サーモンとほうれん草」や「エビやホタテ」等数多くの具材の組み合わせでクリスマスバージョンのオリジナルのグラタンを作ることも可能です。"
            ),
            List(
                id: 5,
                title: "おしゃれパスタ・アラカルト",
                thumbnail: UIImage.init(named: "pasta")!,
                star: 3.5,
                category: "子供が喜ぶ & 彼氏が喜ぶ",
                publishedDate: "2017.12.09",
                descriptionText: "パスタも普段の食卓ではとてもありふれたものかもしれませんが、クリスマスに振舞うパスタに関しては普段の具材よりもぐっと豪華にプレミアム感を出してしまいたいものですよね。"
            ),
            List(
                id: 6,
                title: "熱々＆具沢山が嬉しい手作りピッツア",
                thumbnail: UIImage.init(named: "pizza")!,
                star: 4.2,
                category: "子供が喜ぶ & 彼氏が喜ぶ",
                publishedDate: "2017.12.09",
                descriptionText: "出前で取るピッツアももちろん美味しいと思いますが、オーブンとピザ生地さえあれば自家製のピッツアを手料理として振舞うことが十分に可能です。"
            ),
            List(
                id: 7,
                title: "手間暇かけて作るローストビーフ",
                thumbnail: UIImage.init(named: "roast_beaf")!,
                star: 4.6,
                category: "家庭でも作れる & 彼氏が喜ぶ",
                publishedDate: "2017.12.09",
                descriptionText: "クリスマスといえばやっぱり大皿にドンと盛り付けができる肉料理はやっぱり大きなインパクトがあるものです。特にローストビーフはクリスマスをはじめとしてパーティーにあるだけでその場が盛り上がる便利な料理の一つです。"
            ),
            List(
                id: 8,
                title: "クリスマスに食べたいステーキ",
                thumbnail: UIImage.init(named: "steak")!,
                star: 4.3,
                category: "家庭でも作れる & 彼氏が喜ぶ",
                publishedDate: "2017.12.09",
                descriptionText: "ご馳走の代表格といえばやっぱりステーキ！せっかくの記念日だからお肉のクオリティはもちろん焼き加減にもしっかりとこだわりを持って、料理したいものですね。"
            ),
        ]
    }
}
