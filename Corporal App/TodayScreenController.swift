//
//  TodayScreenController.swift
//  Corporal App
//
//  Created by John Swan on 18.08.2021.
//

import UIKit

class TodayScreenController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
//    let model = Corporal_App.timeTables[0]
    let currentIndex = 0

    @IBOutlet weak var clockLabel: UILabel!
    
    @IBOutlet weak var todayTable: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.todayTable.reloadData()
        print("here I expect data to be reloaded")
    }
//
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        self.todayTable.reloadData()
//    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        clockLabel.text = timeTables[currentIndex].Caption
        
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Going to recalculate model")
        print("Items count = " + String(timeTables[currentIndex].TTItems.count))
        return timeTables[currentIndex].TTItems.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // create cell for table
        let cell = todayTable.dequeueReusableCell(withIdentifier: "TimeEventCell", for: indexPath) as! TimeEventCustomCell

//         Configure the cell...
        let timeTableItem = timeTables[currentIndex].TTItems[indexPath.row]
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
