//
//  ViewController.swift
//  Mening Jamoam
//
//  Created by Davlatshoh Baxtiyorov on 15/12/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tblView: UITableView!
    var students = [StudentModel]()
        
        override func viewDidLoad() {
            super.viewDidLoad()
        }

        override func viewWillAppear(_ animated: Bool) {
            students = ModelManager.getInstance().getAllstudents()
            tblView.reloadData()
        }
        
    }


extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.lblNomi.text = students[indexPath.row].nomi
        cell.lblYoshi.text = students[indexPath.row].yoshi
        cell.lblJoylashuvi.text = students[indexPath.row].joylashuvi
        cell.lblDavlati.text = students[indexPath.row].davlati
        cell.btnEdit.tag = indexPath.row
        cell.btnDelete.tag = indexPath.row
        cell.btnEdit.addTarget(self, action: #selector(onClickEdit(_:)), for: .touchUpInside)
        cell.btnDelete.addTarget(self, action: #selector(onClickDelete(_:)), for: .touchUpInside)
        return cell
    }
    
    
       @objc func onClickEdit(_ sender: UIButton){
           let vc = storyboard?.instantiateViewController(identifier: "AddGamerViewController") as! AddGamerViewController
           vc.studentModel = students[sender.tag]
           vc.headerTitle = "Yangilash"
           navigationController?.pushViewController(vc, animated: true)
       }
       
       @objc func onClickDelete(_ sender: UIButton){
           let isDeleted = ModelManager.getInstance().deleteStudent(student: students[sender.tag])
           students.remove(at: sender.tag)
           tblView.reloadData()
           print("isDeleted :- \(isDeleted)")
       }
    
    internal func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
}
