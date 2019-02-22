//
//  MyModel.swift
//  OneMoreToDoList_Realm
//
//  Created by Joachim Vetter on 22.02.19.
//  Copyright © 2019 Joachim Vetter. All rights reserved.
//

import Foundation
import RealmSwift

class MyModel: Object {
    @objc dynamic var myText: String = ""
    @objc dynamic var myAge: Int = 0
    @objc dynamic var myBool: Bool = false
    @objc dynamic var arrayInCase: Double = 0
}
