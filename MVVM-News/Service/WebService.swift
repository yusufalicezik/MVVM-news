//
//  WebService.swift
//  MVVM-News
//
//  Created by Yusuf ali cezik on 13.09.2019.
//  Copyright © 2019 Yusuf Ali Cezik. All rights reserved.
//

import Foundation
class WebService {
    
    
    static let shared = WebService()
    
    func getArticles(url:URL, completion: @escaping ([Article]?)->()){
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }else if let data = data{
                //print(data)
                let articles = try? JSONDecoder().decode(ArticleList.self, from: data)
                completion(articles?.articles)
            }
        }.resume()
    }
    
}
