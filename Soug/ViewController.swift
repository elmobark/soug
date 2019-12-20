//
//  ViewController.swift
//  Soug
//
//  Created by Mobark on 17/12/2019.
//  Copyright © 2019 Mobark. All rights reserved.
//

import UIKit
import Alamofire
import ImageSlideshow
class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    @IBOutlet weak var typepicker: UIPickerView!

    
    let typies = ["جديد","مستعمل"]
    let cities = ["الكل","الرياض","مكة المكرمة"]
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return component == 1 ? typies.count : cities.count
        
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return component == 1 ? typies[row] : cities[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(component)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   


}

