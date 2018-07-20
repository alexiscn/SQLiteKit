//
//  ViewController.swift
//  SQLiteKitDemo
//
//  Created by xu.shuifeng on 2018/6/1.
//  Copyright © 2018 shuifeng.me. All rights reserved.
//

import UIKit
import SQLiteKit

class ViewController: UIViewController {

    var db: SQLiteConnection!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let dbPath = NSHomeDirectory().appending("/Documents/db.sqlite")
        //try? FileManager.default.removeItem(atPath: dbPath)
        
        db = SQLiteConnection(databasePath: dbPath)
        db.createTable(User.self)
        
        let user = User()
        user.name = "Tom"
        user.age = 20
        user.birthday = Date()
        
        //db?.insert(user)
        
        
        let userTable: SQLiteTableQuery<User> = db.table()
        let count = userTable.count
        print(count)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


class User: SQLiteTable {
    
    var userID: Int
    
    var name: String
    
    var age: Int
    
    var birthday: Date
    
    var avatarData: Data?
    
    static func sqliteAttributes() -> [SQLiteAttribute] {
        return [
            SQLiteAttribute(name: "userID", attribute: .isPK),
            SQLiteAttribute(name: "userID", attribute: .autoInc)
        ]
    }
    
    required init() {
        userID = 0
        name = ""
        age = 0
        birthday = Date()
    }
}
