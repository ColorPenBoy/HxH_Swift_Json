//
//  CityListModel.swift
//  HxHJsonConvertModel
//
//  Created by 张强 on 2016/11/11.
//  Copyright © 2016年 ColorPen. All rights reserved.
//

import Foundation



struct CityListItem {
    
    var name: String
    var pinyin: String
    var zip: String

    static func cityListItems(from jsonData: Data?) -> [CityListItem] {
        
        guard let nonNilJsonData = jsonData,
            let json = try? JSONSerialization.jsonObject(with: nonNilJsonData, options: []),
            let jsonItems = json as? Array<NSDictionary> else {
            return []
        }
    
        // jsonItems 是JSON Array -> Model Array（使用Array.flatMap 传入 转换公式函数 -> 函数式编程）
        return jsonItems.flatMap({ (itemDict: NSDictionary) -> CityListItem? in
            guard let name = itemDict["name"] as? String,
                let pinyin = itemDict["pinyin"] as? String,
                let zip = itemDict["zip"] as? String
                else { return nil }
            
            // 结构体默认初始化函数
            return CityListItem.init(name: name, pinyin: pinyin, zip: zip)
        })
    }
    
}
