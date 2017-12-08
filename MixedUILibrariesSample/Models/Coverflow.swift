//
//  Coverflow.swift
//  MixedUILibrariesSample
//
//  Created by 酒井文也 on 2017/12/09.
//  Copyright © 2017年 酒井文也. All rights reserved.
//

import Foundation
import UIKit

struct Coverflow {
    
    //メンバ変数（ダミーデータを作成する）
    let id: Int
    let thumbnail: UIImage
    
    //イニシャライザ
    init(id: Int, thumbnail: UIImage) {
        self.id        = id
        self.thumbnail = thumbnail
    }

    static func getSampleData() -> [Coverflow] {
        return [
            Coverflow(
                id: 1,
                thumbnail: UIImage.init(named: "coverflow1")!
            ),
            Coverflow(
                id: 2,
                thumbnail: UIImage.init(named: "coverflow2")!
            ),
            Coverflow(
                id: 3,
                thumbnail: UIImage.init(named: "coverflow3")!
            ),
            Coverflow(
                id: 4,
                thumbnail: UIImage.init(named: "coverflow4")!
            ),
            Coverflow(
                id: 5,
                thumbnail: UIImage.init(named: "coverflow5")!
            ),
            Coverflow(
                id: 6,
                thumbnail: UIImage.init(named: "coverflow6")!
            ),
            Coverflow(
                id: 7,
                thumbnail: UIImage.init(named: "coverflow7")!
            ),
            Coverflow(
                id: 8,
                thumbnail: UIImage.init(named: "coverflow8")!
            ),
        ]
    }
}
