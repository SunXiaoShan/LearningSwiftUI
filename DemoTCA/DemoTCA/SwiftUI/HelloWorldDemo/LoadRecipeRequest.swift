//
//  LoadRecipeRequest.swift
//  DemoTCA
//
//  Created by huangphineas on 2023/2/23.
//

import Foundation

struct RecipeModel {
    var id:Int
    var count:Int
    var name:String
}

class LoadRecipeRequest {
    static func loadAllData() async -> [RecipeModel] {
        NSLog("LoadRecipeRequest -> loadAllData()")
        sleep(3)
        var res:[RecipeModel] = []
        for index in 0...50 {
            let rcp = RecipeModel(id: index, count: index * 2, name: "str_\(index)")
            res.append(rcp)
        }

        return res
    }
}
