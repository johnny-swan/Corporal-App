//
//  TimeTablesScreenController.swift
//  Corporal App
//
//  Created by John Swan on 22.08.2021.
//

import UIKit

class TimeTablesScreenController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var timeTablesTable: UITableView!
    
    func checkDelegate() {
        // this delegate should prepare data before upper view will be dismissed
        self.timeTablesTable.reloadData()
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Corporal_App.timeTables.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = timeTablesTable.dequeueReusableCell(withIdentifier: "timeTablesItemsCell", for: indexPath)
        
        cell.textLabel?.text = timeTables[indexPath.row].Caption
        return cell
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeTablesTable.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "editTTSegue":
            print("Edit")
            let index = timeTablesTable.indexPathForSelectedRow?.row
            let dest = segue.destination as! EditTimeTableScreenControllerTableViewController

            dest.currentTimeTable = Corporal_App.timeTables[index!]
            dest.currentTimeTableIndex = index!
            dest.previousView = self
        case "newTTSegue":
            print("New")
            // create new time table in model
            let newTT = TimeTable(TTItems: [], Caption: "new Time Table")
            timeTables.append(newTT)
            let dest = segue.destination as! EditTimeTableScreenControllerTableViewController
            dest.currentTimeTable = timeTables.last!
            dest.currentTimeTableIndex = timeTables.count-1
            dest.previousView = self
            
        default:
            print("Nothing")
        
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
