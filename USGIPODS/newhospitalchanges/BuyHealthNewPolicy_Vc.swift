//
//  BuyHealthNewPolicy_Vc.swift
//  UniversalSompo
//
//  Created by Subesh on 30/09/1400 AP.
//  Copyright © 1400 AP Inmorteltech. All rights reserved.
//


import UIKit


class TabCollectionCell : UICollectionViewCell{
    @IBOutlet weak var btnName_Lbl : UILabel?
    @IBOutlet weak var background_View : UIView?
    @IBOutlet weak var imageicon : UIImageView?

}

class BuyHealthNewPolicy_Vc: UIViewController {
    
    @IBOutlet weak var superHealthcare_View : UIView?
    @IBOutlet weak var arogyaSetu_View : UIView?
    @IBOutlet weak var completeHealth_View : UIView?
    @IBOutlet weak var collection_view : UICollectionView?


    
    var selectIndex = 0


   var btnArraya = ["Complete HealthCare","Super HealthCare","ArogyaSetu healthCare"]
   var imageArraya = ["icons8-heart","icons8-spa_care","icons8-user_groups"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        self.collection_view?.delegate = self
        self.collection_view?.dataSource = self
        
        self.superHealthcare_View?.isHidden  = true
        self.arogyaSetu_View?.isHidden  = true


        // Do any additional setup after loading the view.
    }
   
}

//MARK:- extension for collection view cell
extension BuyHealthNewPolicy_Vc: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return btnArraya.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "TabCollectionCell", for: indexPath) as! TabCollectionCell

        
        cell.background_View?.layer.cornerRadius = 15
        cell.background_View?.layer.borderWidth = 0.5
        //cell.background_View?.layer.borderColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        cell.background_View?.layer.borderColor = UIColor.red.cgColor

        cell.btnName_Lbl?.text  = btnArraya[indexPath.row]
        cell.imageicon?.image = UIImage(named: imageArraya[indexPath.row])
        if selectIndex == indexPath.row{
            cell.background_View?.backgroundColor = #colorLiteral(red: 1, green: 0.862745098, blue: 0.8470588235, alpha: 1)
            cell.background_View?.layer.borderWidth = 0
        }else{
            cell.background_View?.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        }
        return cell
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           return CGSize(width: btnArraya[indexPath.item].size(withAttributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17)]).width + 25, height: 80)//        return CGSize(width: 100, height: bannerCollectionView.frame.size.height)
       }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectIndex = indexPath.row
        self.collection_view?.reloadData()
        print(selectIndex)
        switch selectIndex {
        case 0:
            let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "TabCollectionCell", for: indexPath) as! TabCollectionCell
            self.completeHealth_View?.isHidden  = false
            self.superHealthcare_View?.isHidden  = true
            self.arogyaSetu_View?.isHidden  = true
            cell.background_View?.layer.borderColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
            cell.background_View?.layer.borderWidth = 0

            break
        case 1:
            let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "TabCollectionCell", for: indexPath) as! TabCollectionCell
            self.superHealthcare_View?.isHidden  = false
            self.arogyaSetu_View?.isHidden  = true
            self.completeHealth_View?.isHidden  = true
            cell.background_View?.layer.borderColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
            cell.background_View?.layer.borderWidth = 0

            break
        case 2:
            let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "TabCollectionCell", for: indexPath) as! TabCollectionCell
            self.completeHealth_View?.isHidden  = true
            self.superHealthcare_View?.isHidden  = true
            self.arogyaSetu_View?.isHidden  = false
            cell.background_View?.layer.borderColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
            cell.background_View?.layer.borderWidth = 0

            break
        default:
            break
        }
        
    }
}
