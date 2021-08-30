//
//  EditTimeTableScreenControllerTableViewController.swift
//  Corporal App
//
//  Created by John Swan on 22.08.2021.
//

import UIKit

class EditTimeTableScreenControllerTableViewController: UITableViewController {
    func checkDelegate() {
        print("DELEGATE WORKS")
        self.tableView.reloadData()
        
    }
    var currentTimeTable = TimeTable(TTItems: [], Caption: "New Time Table")
    var currentTimeTableIndex: Int?

    @IBOutlet weak var timeTableCaption: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View did load")
        timeTableCaption.text = currentTimeTable.Caption
        
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("View will appear")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch section {
        case 0:
//            return currentTimeTable.TTItems.count
            return timeTables[currentTimeTableIndex!].TTItems.count
        default:
            return 1
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            // create cell for table
//            let cell = todayTable.dequeueReusableCell(withIdentifier: "TimeEventCell", for: indexPath) as! TimeEventCustomCell
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "AddedItemsCell", for: indexPath)
                as! TimeEventCustomCell
            
            cell.timeEndLabel?.text = "00:00"
            cell.timeStartLabel?.text = "00:00"
            cell.titleLabel?.text = timeTables[currentTimeTableIndex!].TTItems[indexPath.row].title
            
            return cell
            
        } else {

            return tableView.dequeueReusableCell(withIdentifier: "plusItemButtonCell", for: indexPath)
            
        }
        // Configure the cell...

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "newItemSegue" {
            if let dest = segue.destination as? NewItemPopupController {
                dest.currentTimeTableIndex = 0
                dest.previousView = self
            }
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}