//
//  tabsController.swift
//  Soug
//
//  Created by Mobark on 19/12/2019.
//  Copyright © 2019 Mobark. All rights reserved.
//

import UIKit

class tabsController: UIViewController,UITabBarDelegate,UIPickerViewDelegate,UIPickerViewDataSource,UITableViewDelegate,UITableViewDataSource  {
    
    var pick :Selection = Selection(city: "", type: "", cat: "")
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell")
        return cell!
    }
    
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
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        pick.cat = item.title!
        getProduct(data: pick)
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            pick.city = cities[row]
        }else{
            pick.type = typies[row]
        }
        getProduct(data: pick)
    }
    @IBOutlet weak var tabs: UITabBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        tabs.tintColor  = UIColor.white
        tabs.selectedItem = tabs.items?[0]
        pick = Selection(city:cities[0] , type: typies[0], cat: (tabs.items?[0].title)!)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getProduct(data:Selection) {
        Product.getOnline(param: data, completion: {
            products in
            products.forEach({ (pro) in
                print(pro.name)
            })
            
        })
        print("\(data.cat) / \(data.city) / \(data.type)")
    }

}
