//
//  SelectDateViewController.swift
//  FitnesPlan
//
//  Created by Oschepkov Aleksandr on 05.02.2022.
//

import UIKit
import CalendarSwift

class SelectDateViewController: UIViewController,CalendarViewDelegate {

    @IBOutlet weak var calendarView: CalendarView!
    override func viewDidLoad() {
        
        self.calendarView.style.language = "en"
        self.calendarView.delegate = self
        self.calendarView.setupCalendar()
        self.calendarView.selectedYearDelay = 0.3
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func calendarDateChanged(date: Date) {
        print(date)
    }

}
