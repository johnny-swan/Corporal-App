//
//  NewItemPopupController.swift
//  Corporal App
//
//  Created by John Swan on 31.08.2021.
//

import UIKit

class NewItemPopupController: UIViewController, UITextFieldDelegate {
    
    var currentTimeTableIndex: Int?
    var previousView: UIViewController?
    @IBOutlet weak var ttEventName: UITextField!
    
    @IBAction func donePressed(_ sender: Any) {
        // text would be caption for created event
        let text = ttEventName.text != "" ? ttEventName.text : "New Event"
        // create new timetable event
        let newTTItem = TimeTableItem(beginTime: TimeStamp(hours: 11, minutes: 12),
                                      endTime: TimeStamp(hours: 11, minutes: 15),
                                      title: text)
        // add event to model
        //TODO: write OOP-style model for this app
        Corporal_App.timeTables[currentTimeTableIndex!].TTItems.append(newTTItem)
        
        let lastView = previousView as! EditTimeTableScreenControllerTableViewController
        lastView.checkDelegate()
        self.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.endEditing(true)
        
        // tap gesture recognizer is used to dismiss the keyboard by tapping elsewhere
        let tap = UITapGestureRecognizer(target: self,
                                         action: #selector(self.tapEverywhere(_:)))
    
        self.view.addGestureRecognizer(tap)
    }
    
    @objc func tapEverywhere(_ gesture: UITapGestureRecognizer) {
        // this funciton called when user tapped on blank space in view
        print("tapped")
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("Return pressed")
        self.view.endEditing(true)
        return true
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
