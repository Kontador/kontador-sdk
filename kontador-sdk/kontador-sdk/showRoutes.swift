//
//  showRoutes.swift
//  kontador-sdk
//
//  Created by yafilipp on 12.10.15.
//  Copyright © 2015 Филипп. All rights reserved.
//

import Foundation
import UIKit

class selectRoute: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var routesCollection: UIPickerView!
    @IBOutlet weak var lab: UILabel!
    
    var routes: [String] = [String]()
    var pickedRoute = String()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        self.routesCollection.delegate = self
        self.routesCollection.dataSource = self
        
        routes = ["1", "2", "3", "4", "5"]
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return routes.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return routes[row]
    }
    // New selection
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickedRoute = routes[row]
        lab.text = "Загрузка маршрута " + routes[row]
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let DestViewController : mapWorking = segue.destinationViewController as! mapWorking
        
        DestViewController.route = pickedRoute
    }
    
    

    
}