//
//  TodayScreenController.swift
//  Corporal App
//
//  Created by John Swan on 18.08.2021.
//

import UIKit

class TodayScreenController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    let model = Corporal_App.timeTables[0]

    @IBOutlet weak var clockLabel: UILabel!
    
    @IBOutlet weak var todayTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        clockLabel.text = model.Caption
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = model.TTItems.count
        print("Model items count:"+String(count))
        return count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // create cell for table
        let cell = todayTable.dequeueReusableCell(withIdentifier: "TimeEventCell", for: indexPath) as! TimeEventCustomCell

//         Configure the cell...
        let timeTableItem = model.TTItems[indexPath.row]
        cell.titleLabel?.text = timeTableItem.title

        cell.timeStartLabel?.text = String(describing:  timeTableItem.beginTime)
        if timeTableItem.endTime != nil {
            cell.timeEndLabel?.text = String(describing: timeTableItem.endTime!)
            
        } else {
            cell.timeEndLabel?.isHidden = true
        }

        return cell
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
