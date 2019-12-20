//
//  utils.swift
//  Soug
//
//  Created by Mobark on 19/12/2019.
//  Copyright © 2019 Mobark. All rights reserved.
//

import Foundation
import Alamofire
class utils{
    var BASE_URL = "http://muhana9.com/"
    var API_URL = ""
    var BASE_IMAGE = ""
    init() {
        API_URL = BASE_URL + "markapp/app/"
        BASE_IMAGE = BASE_URL + "markapp/uploads/"
    }
    
    private func JsonDictionary(url: String,completion : @escaping (String)->())  {
        var _ :String
        Alamofire.request(url, method: .get)
            .responseJSON { response in
                
                if let json = response.result.value as?String{
                    completion(json)
                }
        }
    }

}
