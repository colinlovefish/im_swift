//
//  SQLManager.swift
//  coinandcoin
//
//  Created by yinghu on 2020/8/4.
//  Copyright © 2020 deepcoin. All rights reserved.
//

import UIKit
import SQLite
import HandyJSON

let user_column = Expression<String>("user_account")
let balance_column = Expression<String>("user_balance")

let id_column = rowid

class SQLManager: NSObject {
    static let  manager = SQLManager()
    private var db : Connection?
    private var table: Table?
    
    
    func getDB() -> Connection {
        if db == nil {
            let  path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first!
            db = try! Connection("\(path)/db.sqlite3")
            db?.busyTimeout = 5.0
            
        }
        return db!
    }
    
  
    
    
    func getTable() -> Table {
        
        if table == nil {
            
            table = Table("records")
            
            try! getDB().run(
                table!.create(temporary: false, ifNotExists: true, withoutRowid: false, block: { (builder) in
                    
                    builder.column(user_column)
                    builder.column(balance_column)
                    
                })
            )
            
        }
        return table!
        
    }
    
    //增
    func insert(item: DBItem) {
        
         var temp_column : Expression<String>?
         var temp_value : String = ""
        if item.userInfo != nil && item.userInfo?.count != 0{
             temp_column = user_column
            temp_value = item.userInfo ?? ""
        } else if item.balanceInfo != nil && item.balanceInfo?.count != 0{
             temp_column = balance_column
            temp_value = item.balanceInfo ?? ""
         }
        
       
        
        let insert = getTable().insert(user_column <- temp_value)
        if let rowId = try? getDB().run(insert) {
            debugPrint("插入成功：\(rowId)")
        } else {
            debugPrint("插入失败")
        }
        
    }
    
    //删单条
    func delete(id: Int64) {
        
        delete(filter: rowid == id)
        
    }
    
    //根据条件删除
    func delete(filter: Expression<Bool>? = nil) {
        
        var query = getTable()
        if let f = filter {
            query = query.filter(f)
        }
        if let count = try? getDB().run(query.delete()) {
            debugPrint("删除的条数为：\(count)")
        } else {
            debugPrint("删除失败")
        }
        
    }
    
    //改
    func update( item : DBItem) {
        
        var temp_column : Expression<String>?
        var temp_value : String = ""
        if item.userInfo != nil && item.userInfo?.count != 0{
            temp_column = user_column
            temp_value = item.userInfo ?? ""
        } else if item.balanceInfo != nil && item.balanceInfo?.count != 0{
            temp_column = balance_column
            temp_value = item.balanceInfo ?? ""
        }
        
       let temp = search(filter: temp_column! == user_column, select: [rowid, temp_column!], order: [temp_column!.desc], limit: nil, offset: nil)
        debugPrint("查询结果：\(temp)")
        if temp.count == 0 {
            insert(item: item)
        } else {
            let update = getTable().filter(rowid == item.id)
            if let count = try? getDB().run(update.update(temp_column! <- temp_value)) {
                debugPrint("修改的结果为：\(count == 1)")
            } else {
                debugPrint("修改失败")
            }
        }
   
        
    }
    
    //查
    func search(filter: Expression<Bool>? = nil, select: [Expressible] = [rowid, user_column], order: [Expressible] = [user_column.desc], limit: Int? = nil, offset: Int? = nil) -> [Row] {
        
        var query = getTable().select(select).order(order)
        if let f = filter {
            query = query.filter(f)
        }
        if let l = limit {
            if let o = offset{
                query = query.limit(l, offset: o)
            }else {
                query = query.limit(l)
            }
        }
        
        let result = try! getDB().prepare(query)
        return Array(result)
        
    }
    
}
