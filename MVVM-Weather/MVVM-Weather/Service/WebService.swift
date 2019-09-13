//
//  WebService.swift
//  MVVM-Weather
//
//  Created by Yusuf ali cezik on 13.09.2019.
//  Copyright © 2019 Yusuf Ali Cezik. All rights reserved.
//

import Foundation

struct Resource<T> {
    let url:URL
    let parse : (Data)->T?
}

final class WebService{
    
    static let shared = WebService()
    
    
    func load<T>(resorcue:Resource<T>, completion : @escaping (T?)->()){
        URLSession.shared.dataTask(with: resorcue.url) { (data, response, error) in
            if let data = data{
                DispatchQueue.main.async {
                    completion(resorcue.parse(data))
                }
            }else{
                completion(nil)
            }
        }.resume()
    }
}
