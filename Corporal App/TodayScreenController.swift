//
//  TodayScreenController.swift
//  Corporal App
//
//  Created by John Swan on 18.08.2021.
//

import UIKit

class TodayScreenController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    let currentIndex = 0
    
    // reference to managed objects context
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var events: [TimeTableEvent]?
    

    
    
    private let refreshControl = UIRefreshControl()

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
        
        // create some dummy events to be saved for future
//        let newTimeTableEvent = TimeTableEvent(context: self.context)
//        newTimeTableEvent.caption = "First"
//        newTimeTableEvent.startHour = 10
//        newTimeTableEvent.startMinute = 0
//
//        try! self.context.save()

        // Do any additional setup after loading the view.
        clockLabel.text = timeTables[currentIndex].Caption
        
        // Create refresh control for table
        if #available(iOS 10.0, *)  {
            todayTable.refreshControl = refreshControl
        }
        refreshControl.addTarget(self, action: #selector(updateTable(_:)), for: .valueChanged)
        fetchEvents()

    }
    func fetchEvents() {
        // fetch current time table events from Core Data
        events = try! context.fetch(TimeTableEvent.fetchRequest() )
        DispatchQueue.main.async {
            self.todayTable.reloadData()
        }
    }
    @objc func updateTable(_ sender: Any) {
        todayTable.reloadData()
        print("Data should be reloaded")
        refreshControl.endRefreshing()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Going to recalculate model")
        print("Items count = " + String(timeTables[currentIndex].TTItems.count))
//        return timeTables[currentIndex].TTItems.count
        return events!.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // create cell for table
        let cell = todayTable.dequeueReusableCell(withIdentifier: "TimeEventCell", for: indexPath) as! TimeEventCustomCell

//         Configure the cell...
        // old implementation
//        let timeTableItem = timeTables[currentIndex].TTItems[indexPath.row]
//        cell.titleLabel?.text = timeTableItem.title
//
//        cell.timeStartLabel?.text = String(describing:  timeTableItem.beginTime)
//        if timeTableItem.endTime != nil {
//            cell.timeEndLabel?.text = String(describing: timeTableItem.endTime!)
//
//        } else {
//            cell.timeEndLabel?.isHidden = true
//        }
        // coreData implementation
        let ttEvent = self.events![indexPath.row]
        cell.timeStartLabel?.text = String(ttEvent.startHour)+":"+String(ttEvent.startMinute)
        cell.timeEndLabel?.text = "--:--"
        cell.titleLabel?.text = ttEvent.caption!

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
