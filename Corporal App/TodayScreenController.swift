//
//  TodayScreenController.swift
//  Corporal App
//
//  Created by John Swan on 18.08.2021.
//

import UIKit

class TodayScreenController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    let model = Corporal_App.defaultTimeTable

    @IBOutlet weak var clockLabel: UILabel!
    
    @IBOutlet weak var todayTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = model.count
        print("Model items count:"+String(count))
        return model.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // create cell for table
        let cell = todayTable.dequeueReusableCell(withIdentifier: "TimeEventCell", for: indexPath) as! TimeEventCustomCell

//         Configure the cell...
        let timeTableItem = model[indexPath.row]
        cell.titleLabel?.text = timeTableItem.title
        let timeString = String(timeTableItem.beginTime.hours!)+":"+String(timeTableItem.beginTime.minutes!)

        cell.timeStartLabel?.text = timeString
        cell.timeEndLabel?.text = "00:00"

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
