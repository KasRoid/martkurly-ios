//
//  Category.swift
//  martkurly
//
//  Created by 천지운 on 2020/09/23.
//  Copyright © 2020 Team3x3. All rights reserved.
//

import Foundation

struct Category: Decodable {
    let name: String            // 카테고리 이름
    let category_img: String    // 카테고리 이미지
    var types: [CategoryType]

    struct CategoryType: Decodable {
        let name: String        // 타입 이름
        var products: [Product]?
    }
}

class CategoryHelpers {
    static let shared = CategoryHelpers()
    private init() { }

    var categoryList: [Category]?
}
