//
//  ModelManager.swift
//  Mening Jamoam
//
//  Created by Davlatshoh Baxtiyorov on 17/12/23.
//

import Foundation
import UIKit

var shareInstance = ModelManager()

class ModelManager{
    
    var database : FMDatabase? = nil
    
    static func getInstance() -> ModelManager{
        if shareInstance.database == nil{
            shareInstance.database = FMDatabase(path: Util.share.getPath(dbName: "MyTeam.db"))
        }
        return shareInstance
    }
    
    
    //MARK: - Saving data
    func SaveData(studentModel : StudentModel) -> Bool{
        shareInstance.database?.open()
        let isSave = shareInstance.database?.executeUpdate("INSERT INTO Futbolchilar (nomi, yoshi, joylashuvi, davlati) VALUES(?,?,?,?)", withArgumentsIn: [studentModel.nomi, studentModel.yoshi, studentModel.joylashuvi, studentModel.davlati])
        shareInstance.database?.close()
        return isSave!
    }
    
    //MARK: - Get All Students data
        func getAllstudents() -> [StudentModel]{
            shareInstance.database?.open()
            //FMResultSet  :  Used to hold result of SQL query on FMDatabase object.
            let resultSet : FMResultSet! = try! shareInstance.database?.executeQuery("SELECT * FROM Futbolchilar", values: nil)
            var allStudents = [StudentModel]()
            
            if resultSet != nil{
                while resultSet.next() {
                    let studentModel = StudentModel(ID: resultSet.string(forColumn: "ID")!, nomi: resultSet.string(forColumn: "nomi")!, yoshi: resultSet.string(forColumn: "yoshi")!, joylashuvi: resultSet.string(forColumn: "joylashuvi")!, davlati: resultSet.string(forColumn: "davlati")!)
                    allStudents.append(studentModel)
                }
            }
            shareInstance.database?.close()
            return allStudents
        }
        
        
        //MARK: - Update Students data
        func updateStudent(student: StudentModel) -> Bool{
            shareInstance.database?.open()
            
            let isUpdated = shareInstance.database?.executeUpdate("UPDATE Futbolchilar SET nomi=?, yoshi=?, joylashuvi=?, davlati=? WHERE id=? ", withArgumentsIn: [student.nomi,student.yoshi, student.joylashuvi, student.davlati, student.ID])
            
            shareInstance.database?.close()
            return isUpdated!
        }
        
        
        //MARK: - Deleting Students data
        func deleteStudent(student: StudentModel) -> Bool{
            shareInstance.database?.open()
            let isDeleted = (shareInstance.database?.executeUpdate("DELETE FROM Futbolchilar WHERE nomi=?", withArgumentsIn: [student.nomi]))
            shareInstance.database?.close()
            return isDeleted!
        }
    }

    
       


