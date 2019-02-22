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
        instance1.myText = "Sudoku und KAK"
        writeToRealm()
    }
    
    @IBAction func Button2(_ sender: UIButton) {
        myLabel.text = myLabel.text! + " und Kakuro"
    }
    
    func writeToRealm() {
        
        do {
            try realm.write {
                realm.add(instance1)
            }
        }
        catch {
            print("\(error)")
        }
    }
    
    func readFromRealm() {
        myResults = realm.objects(MyModel.self)
        if let myResults2 = myResults, myResults2.count > 0 {
            let text1 = myResults2[myResults2.count - 1].myText
            let text2 = "\(myResults2[myResults2.count - 1].myAge)"
            myLabel.text = "\(text1) \(text2)"
        }
    }
    
    func deleteAllObjects() {
        try! realm.write {
            realm.deleteAll()
        }
    }
}

