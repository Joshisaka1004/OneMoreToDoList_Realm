//
//  ViewController.swift
//  OneMoreToDoList_Realm
//
//  Created by Joachim Vetter on 22.02.19.
//  Copyright © 2019 Joachim Vetter. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    
    var myResults: Results<MyModel>?
    let realm = try! Realm()
    let instance1 = MyModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        //deleteAllObjects()
        readFromRealm()
    }

    @IBAction func Button1(_ sender: UIButton) {
        myLabel.text = "Sudoku und KAK"
        writeToRealm(senderButton: 1)
    }
    
    @IBAction func Button2(_ sender: UIButton) {
        //let instance2 = MyModel()
        myLabel.text = "400"
        try! realm.write {
            instance1.myAge = 400
            realm.add(instance1)
        }
    }
    
    func writeToRealm(senderButton: Int = 0) {
        print(senderButton)
        try! realm.write {
            instance1.myText = myLabel.text!
            realm.add(instance1)
        }
    }
    
    func readFromRealm() {
        myResults = realm.objects(MyModel.self)
        if let myResults2 = myResults, myResults2.count > 0 {
            let text1 = myResults2[myResults2.count - 1].myText
            let text2 = myResults2[myResults2.count - 1].myAge != 0 ? myResults2[myResults2.count - 1].myAge : 20//"\(myResults2[myResults2.count - 1].myAge)"
            myLabel.text = "\(text1) \(text2)"
        }
    }
    
    func deleteAllObjects() {
        try! realm.write {
            realm.deleteAll()
        }
    }
}

