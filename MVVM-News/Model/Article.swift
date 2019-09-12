//
//  Article.swift
//  MVVM-News
//
//  Created by Yusuf ali cezik on 13.09.2019.
//  Copyright © 2019 Yusuf Ali Cezik. All rights reserved.
//

import Foundation


struct ArticleList : Decodable{
    let articles : [Article]
}

struct Article : Decodable {
    let title:String
    let description:String
    let urlToImage:String
}
