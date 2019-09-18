//
//  MainViewController.swift
//  CarFaxHomeProject
//
//  Created by Becca Akinlaja on 9/12/19.
//  Copyright © 2019 Becca Akinlaja. All rights reserved.
//

import UIKit

 let urlString = "https://carfax-for-consumers.firebaseio.com/assignment.json"

class MainViewController: UIViewController, UITabBarDelegate, UITableViewDataSource {
    
    // MARK: - Variables
    
    var vehicles: Vehicle!
    var vehicleArray = [Vehicle]()
  
   
    // MARK: - Outlet
    @IBOutlet weak var tableView: UITableView!
    
    //  // MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
         self.getVehicleJson()
        
        
    }
   
   
    

    func getVehicleJson () {
       guard let url = URL(string: urlString) else {return}
        //let session = URLSession.shared
        URLSession(configuration: URLSessionConfiguration.default).dataTask(with: url) { data, response, error in
     //   let task = session.dataTask(with: url) { (data, response, error) in
            guard error == nil else{
                print("returning error")
                return
            }
            guard let content = data else {
                print("Not returning data")
                return
            }
            
            guard let jsonObj = (try? JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers)) as? Dictionary<String,AnyObject> else {
                print("Not containing Json")
                return
            }
            
            if let listingInfo = jsonObj["listings"] as? [Dictionary<String,AnyObject>] {
                for item in listingInfo {
                    if item["images"]?["baseUrl"] != nil {
                    let vehicle = Vehicle(vehiclesDict: item)
                    self.vehicleArray.append(vehicle)
                        }
                    }
                
            }
         
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }.resume()
        
        
    }
    
    //MARK: - Table View
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vehicleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "vehicleCell", for: indexPath) as? VehicleTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configureCell(vehicleInfo: vehicleArray[indexPath.row])
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    
    
}


