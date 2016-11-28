//
//  ViewController.swift
//  HxHJsonConvertModel
//
//  Created by 张强 on 2016/11/11.
//  Copyright © 2016年 ColorPen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let CellID = "CityListCell"
    var dataArray : [CityListItem] = []
    
    @IBOutlet weak var mainTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        dataArray = CityListItem.cityListItems(from: getCityData())
        mainTableView.reloadData()
    }
    
    private func getCityData() -> Data? {
        
        guard let file = Bundle.main.path(forResource: "city", ofType: "json") else {
            print("Get Data File Fail")
            return Data.init()
        }
        
        guard let jsonData = try? Data(contentsOf: URL(fileURLWithPath: file)) else {
            print("Get City Data From File Fail")
            return Data.init()
        }
        return jsonData
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model : CityListItem = dataArray[indexPath.row]
        let cell : CityListCell = tableView.dequeueReusableCell(withIdentifier: CellID, for: indexPath) as! CityListCell
        cell.nameLabel.text = model.name
        cell.pinyinLabel.text = model.pinyin
        cell.zipLabel.text = model.zip
        return cell
    }
}
