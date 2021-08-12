//
//  voltDownData.swift
//  Betelgeuse
//
//  Created by 由上博之 on 2021/07/29.
//

import RealmSwift

class voltDownData: Object {
    
    @objc dynamic var id = 1
    @objc dynamic var volt: String = ""
    //Dictionary<String,Float> = ["":0]
    @objc dynamic var cable: String = ""
    @objc dynamic var cablesize: String = ""
    @objc dynamic var frequency: String = ""
    @objc dynamic var factor: String = ""
    @objc dynamic var current: Float = 0
    @objc dynamic var distance: Float = 0
    @objc dynamic var voltDown: Float = 0
    @objc dynamic var voltDownRate: Float = 0
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
