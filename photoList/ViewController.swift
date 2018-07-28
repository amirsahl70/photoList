//
//  ViewController.swift
//  photoList
//
//  Created by Amir on 7/15/2016.
//  Copyright © 2018 uni. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    var upData = Data()
    var albumOfPhotos :[photo] = []
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downlaodData()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func downlaodData() {
        print("downloadData")
        guard let downlowdURL = URL(string: "https://jsonplaceholder.typicode.com/photos") else { return }
        HttpHandler.dataRequest(url: downlowdURL, completionHandler:parseData)
    
    }
    func parseData(json : JSON){
       self.albumOfPhotos =  parsJSONToPhoto.parseData(json : json)
        print(albumOfPhotos.count )
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }

    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return self.albumOfPhotos.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //return tableView.frame.size.height
        return 100
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cellView = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell
        
        let idx: Int = indexPath.row
        
        cellView.Id.text = "Id: " + albumOfPhotos[indexPath.row].id!
        cellView.Title.text = "Title: " +  albumOfPhotos[indexPath.row].title!
        
        displayImage(idx, photoCell: cellView)

        return cellView
    }
    func displayImage(_ row: Int, photoCell: CustomTableViewCell) {
        
        guard let url = URL(string: albumOfPhotos[row].thumbnail!) else { return }

        Alamofire.request(url ).responseData { response in

            let data = response.data!
            DispatchQueue.main.async(execute: {
                let image = UIImage(data: data)
                photoCell.photoImageView.image = image
            })
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

