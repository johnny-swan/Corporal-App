//
//  NewItemPopupController.swift
//  Corporal App
//
//  Created by John Swan on 31.08.2021.
//

import UIKit

class NewItemPopupController: UIViewController {
    
    var currentTimeTableIndex: Int?
    var previousView: UIViewController?

    @IBAction func donePressed(_ sender: Any) {
        print("Should dismiss")
        let newTTItem = TimeTableItem(beginTime: TimeStamp(hours: 11, minutes: 12), endTime: TimeStamp(hours: 11, minutes: 15), title: "NEW!!")
        Corporal_App.timeTables[currentTimeTableIndex!].TTItems.append(newTTItem)
        print(Corporal_App.timeTables[currentTimeTableIndex!])
//        if previousView is EditTimeTableScreenControllerTableViewController{
//            print("it is")
//            previousView.tableView.reloadData()
//        }
        let lastView = previousView as! EditTimeTableScreenControllerTableViewController
//        lastView.reloadData()
        lastView.checkDelegate()
        self.dismiss(animated: true)

        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
