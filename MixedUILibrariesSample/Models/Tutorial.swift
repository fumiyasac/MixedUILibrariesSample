//
//  Tutorial.swift
//  MixedUILibrariesSample
//
//  Created by 酒井文也 on 2017/12/09.
//  Copyright © 2017年 酒井文也. All rights reserved.
//

import Foundation
import UIKit

struct Tutorial {
    
    //メンバ変数（ダミーデータを作成する）
    let id: Int
    let title: String
    let thumbnail: UIImage
    
    //イニシャライザ
    init(id: Int, title: String, thumbnail: UIImage) {
        self.id        = id
        self.title     = title
        self.thumbnail = thumbnail
    }
    
    static func getSampleData() -> [Tutorial] {
        return [
            Tutorial(
                id: 1,
                title: "1枚目のチュートリアルになります。",
                thumbnail: UIImage.init(named: "tutorial1")!
            ),
            Tutorial(
                id: 2,
                title: "2枚目のチュートリアルになります。",
                thumbnail: UIImage.init(named: "tutorial2")!
            ),
            Tutorial(
                id: 3,
                title: "3枚目のチュートリアルになります。",
                thumbnail: UIImage.init(named: "tutorial3")!
            )
        ]
    }
}
