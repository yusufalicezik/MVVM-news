//
//  ArticleViewModel.swift
//  MVVM-News
//
//  Created by Yusuf ali cezik on 13.09.2019.
//  Copyright © 2019 Yusuf Ali Cezik. All rights reserved.
//

import UIKit


struct ArticleListViewModel{
    let articles: [Article]
}

extension ArticleListViewModel{
    var numberOfSections : Int {
        return 1
    }
    func numberOfRowsInSection(_ section:Int)->Int{
        return self.articles.count
    }
    func articleAtIndex(_ index:Int)->ArticleViewModel{
        let article = self.articles[index]
        return ArticleViewModel(article)
    }
}




struct ArticleViewModel {
    private let article : Article
}

extension ArticleViewModel{
    init(_ article: Article) {
        self.article = article
    }
}

extension ArticleViewModel{
    var title : String {
        return article.title
    }
    
    var description : String {
        return article.description
    }
    var urlToImage:String {
        return article.urlToImage
    }
}
