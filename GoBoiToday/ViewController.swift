//
//  ViewController.swift
//  GoBoiToday
//
//  Created by ThiVo on 11/7/16.
//  Copyright © 2016 Fly. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    var homeItemList : Array<HomeItemStruct> = []
    var snusBrandsArray = [[String:AnyObject]]()

    override func viewDidLoad() {
        super.viewDidLoad();
        

        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 134, height: 38))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "TitleImage")
        imageView.image = image
        navigationItem.titleView = imageView
        // Do any additional setup after loading the view, typically from a nib.
        tableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeTableViewCell")
        tableView.separatorColor = UIColor.clear
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //activityIndicatorView.startAnimating()
        self.loadDataToCell()
        //activityIndicatorView.stopAnimating()
        self.tableView.reloadData()

    }

    func loadDataToCell(){
        var ref : FIRDatabaseReference!
        ref = FIRDatabase.database().reference()
        let homeRef = ref.child("Homepage")
        homeRef.observeSingleEvent(of: .value, with: { snapshot in
            
            for child in snapshot.children {
                let childSnap = child as! FIRDataSnapshot
                let snapshotValue = childSnap.value as! [String:AnyObject]
                
        
                let item = HomeItemStruct(title: snapshotValue["title"] as? String ?? "", desCription: snapshotValue["desCription"] as? String ?? "", isCallable: snapshotValue["desCription"] as? Bool ?? false, imageIcon: UIImage(named: snapshotValue["iconName"] as? String ?? "book")!, iconBackgroudColor: self.hexStringToUIColor(hex: snapshotValue["iconBackgroudColor"] as? String ?? "00ad9d"))
                self.homeItemList.append(item)
            }
            self.tableView.reloadData()
        })
    }
    
    
    private func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeItemList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 70;
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath as IndexPath) as! HomeTableViewCell
        
        cell.lblTitle.text = homeItemList[indexPath.row].title
        cell.lblDescription.text = homeItemList[indexPath.row].desCription
        cell.callButtonViewOuter.isHidden = !homeItemList[indexPath.row].isCallable
        cell.iconView.backgroundColor = homeItemList[indexPath.row].iconBackgroudColor
        cell.imgIcon.image = homeItemList[indexPath.row].imageIcon
        cell.selectionStyle = .none
        return cell

    }
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.characters.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }

}

struct HomeItemStruct {
    let title: String
    let desCription: String
    let isCallable : Bool
    let imageIcon : UIImage
    let iconBackgroudColor : UIColor
}

extension Bool {
    
    init?(string: String) {
        switch string {
        case "True", "true", "yes", "1":
            self = true
        case "False", "false", "no", "0":
            self = false
        default:
            return nil
        }
    }
    
}

