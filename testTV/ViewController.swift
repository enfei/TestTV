//
//  ViewController.swift
//  testTV
//
//  Created by King on 21/09/2017.
//  Copyright © 2017 GP. All rights reserved.
//

import UIKit
import Alamofire
import RSLoadingView
import SwiftyJSON

class ViewController: UIViewController {
    
    fileprivate let cellIdentifier = "MyTableViewCell"
    fileprivate let requestURL = "https://support.magcite.com/test.json"
    
    @IBOutlet weak var tableView: UITableView!
    
    var tableData: [TestModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func refreshButtonPressed(_ sender: Any) {
        loadData()
    }

    func loadData() {
        
        tableData.removeAll()
        
        showLoading()
        Alamofire.request(requestURL).responseJSON { (response) in
            self.hideLoading()
            guard let value = response.result.value else { return }
            let json = JSON(value)
            for subJson in json["entries"].arrayValue {
                let model = TestModel(json: subJson)
                self.tableData.append(model)
            }
            self.tableView.reloadData()
        }
    }
    
    func showLoading() {
        let loadingView = RSLoadingView(effectType: RSLoadingView.Effect.twins)
        loadingView.show(on: view)
    }
    
    func hideLoading() {
        RSLoadingView.hide(from: view)
    }

}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! MyTableViewCell
        
        cell.data = tableData[indexPath.row]
        
        return cell
    }
}

