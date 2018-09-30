
import UIKit

import RealmSwift

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    // -----------------------  Kho Dữ liệu  -----------------------
    
    var realm = try! Realm()
    
    func getData(vitri : Int) -> String
    {
        let All_Item = realm.objects(ToDo.self)
        
        return All_Item[vitri].dosomething
    }
    

    
    
    // -----------------------  Ánh xạ  -----------------------

    @IBOutlet weak var txt_TextField: UITextField!
    
    @IBAction func btn_Add(_ sender: Any)
    {
        guard let text = txt_TextField.text else {  return   }
        
        
        let Obj_todo = ToDo();
        Obj_todo.dosomething = text;
        
            
        try! realm.write
        {
            realm.add(Obj_todo)
        }
    
        tableV.reloadData()
    }
    
    
    // -----------------------  Table View  -----------------------
    
    @IBOutlet weak var tableV: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
        -> Int
    {
        return realm.objects(ToDo.self).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell
    {
        let cell = tableV.dequeueReusableCell(withIdentifier: "Cell") as! Custom_Cell
        
        cell.lbl_Text.text = getData(vitri: indexPath.row)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        
        if  editingStyle == .delete
        {
            let All_Item = realm.objects(ToDo.self)
            
            let ItemToDelete = All_Item[indexPath.row];
            
            try! realm.write {
                realm.delete(ItemToDelete)
            }
            
            tableV.reloadData()
        }
        
        
    }
    
    
    // -----------------------  Main  -----------------------
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        tableV.dataSource = self
        tableV.delegate = self
        
//        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }

}

