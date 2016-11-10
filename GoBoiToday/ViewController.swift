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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadDataToCell()

        let rootRef = FIRDatabase.database().reference()
        let childlRef = FIRDatabase.database().reference(withPath: "number")
        let itemsRef = rootRef.child("number")
        let milkRef = itemsRef.child("color")
        print(rootRef.key)
        print(childlRef.key)
        print(itemsRef.key)
        print(milkRef.key)

        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 134, height: 38))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "TitleImage1")
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
        tableView.reloadData()
    }

    func loadDataToCell(){
        let First = HomeItemStruct(title: "Cafe",desCription: "Speak to a nurse", isCallable: true, imageIcon: UIImage(named: "callitem")!, iconBackgroudColor: hexStringToUIColor(hex: "0078C0"))
        let Second = HomeItemStruct(title: "School",desCription: "Get directions to your appoitment", isCallable: false, imageIcon: UIImage(named: "marker")!, iconBackgroudColor: hexStringToUIColor(hex: "FF6B0B"))
        let Third = HomeItemStruct(title: "Hospital",desCription: "1 appoitment: Today at 10 AM", isCallable: false, imageIcon: UIImage(named: "calendar")!, iconBackgroudColor: hexStringToUIColor(hex: "F63333"))
        let Fourth = HomeItemStruct(title: "Specific Place",desCription: "All about our locations and services", isCallable: false, imageIcon: UIImage(named: "hospital")!, iconBackgroudColor: hexStringToUIColor(hex: "EDA900"))
        let Fifth = HomeItemStruct(title: "Restaurant",desCription: "Talk to our doctors or nurses", isCallable: false, imageIcon: UIImage(named: "caple")!, iconBackgroudColor: hexStringToUIColor(hex: "77777A"))
        let Sixth = HomeItemStruct(title: "Park",desCription: "Access your patient portal", isCallable: false, imageIcon: UIImage(named: "ava")!, iconBackgroudColor: hexStringToUIColor(hex: "0078C0"))
        let Seventh = HomeItemStruct(title: "Karaoke", desCription: "Access your patient portal",isCallable: false, imageIcon: UIImage(named: "question")!, iconBackgroudColor: hexStringToUIColor(hex: "3FAE29"))
        let Eighth = HomeItemStruct(title: "Govement",desCription: "Manage my condition", isCallable: false, imageIcon: UIImage(named: "book")!, iconBackgroudColor: hexStringToUIColor(hex: "C126B8"))
        
        homeItemList.append(First)
        homeItemList.append(Second)
        homeItemList.append(Third)
        homeItemList.append(Fourth)
        homeItemList.append(Fifth)
        homeItemList.append(Sixth)
        homeItemList.append(Seventh)
        homeItemList.append(Eighth)
    }
    
    
    private func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
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


