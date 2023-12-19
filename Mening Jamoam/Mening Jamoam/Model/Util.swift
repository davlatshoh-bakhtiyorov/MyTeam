//
//  Util.swift
//  Mening Jamoam
//
//  Created by Davlatshoh Baxtiyorov on 17/12/23.
//

import Foundation
import UIKit

class Util {
    
    static let share = Util()
        
    //MARK:- Getting path of our Database
    func getPath(dbName: String) -> String{
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileUrl = documentDirectory.appendingPathComponent(dbName)
        print(fileUrl.path)
        return fileUrl.path
        }
    
    //MARK:- If Database path is not exists then creating database path
    func copyDatabase(dbName: String){
        let dbPath = getPath(dbName: "MyTeam.db")
        let fileManager = FileManager.default
            
        if !fileManager.fileExists(atPath: dbPath){
            let bundle = Bundle.main.resourceURL
            let file = bundle?.appendingPathComponent(dbName)
            
            do{
                try fileManager.copyItem(atPath: file!.path, toPath: dbPath)
            }
            catch let err{
                print(err.localizedDescription)
            }
        }
    }


}
