//
//  AddGamerViewController.swift
//  Mening Jamoam
//
//  Created by Davlatshoh Baxtiyorov on 15/12/23.
//

import UIKit

class AddGamerViewController: UIViewController {
    
    
    @IBOutlet weak var txtNomi: UITextField!
    @IBOutlet weak var txtYoshi: UITextField!
    @IBOutlet weak var txtJoshlashuvi: UITextField!
    @IBOutlet weak var txtDavlati: UITextField!
    @IBOutlet weak var btnSaqlash: UIButton!
    
    var studentModel : StudentModel?
    var headerTitle = ""
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        if headerTitle != ""{
            self.title = headerTitle
            txtNomi.text = studentModel?.nomi
            txtYoshi.text = studentModel?.yoshi
            txtJoshlashuvi.text = studentModel?.joylashuvi
            txtDavlati.text = studentModel?.davlati
            
            
            // Do any additional setup after loading the view.
        }
        }
    
    @IBAction func onClickAdd(_ sender: UIButton) {
        if headerTitle != ""{
            let student = StudentModel(ID: studentModel!.ID, nomi: txtNomi.text!, yoshi: txtYoshi.text!, joylashuvi: txtJoshlashuvi.text!, davlati: txtDavlati.text!)
                    let isUpdate = ModelManager.getInstance().updateStudent(student: student)
                    print("isUpdate :- \(isUpdate)")
                }
                else{
                    let student = StudentModel(ID: "", nomi: txtNomi.text!, yoshi: txtYoshi.text!, joylashuvi: txtJoshlashuvi.text!, davlati: txtDavlati.text!)
                    let isSave = ModelManager.getInstance().SaveData(studentModel: student)
                    print("isSave :- \(isSave)")
                }
        }
}

