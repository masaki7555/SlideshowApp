//
//  ImgdetailViewController.swift
//  SlideshowApp
//
//  Created by 宇都宮 正暉 on 2018/03/10.
//  Copyright © 2018年 masaki.utsunomiya. All rights reserved.
//

import UIKit

class ImgdetailViewController: UIViewController {
    
    var img_count = 0
    
    var img1 = UIImage(named:"img1.jpg")
    var img2 = UIImage(named:"img2.jpg")
    var img3 = UIImage(named:"img3.jpg")
    
    @IBOutlet weak var detail: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switch self.img_count {
        case 1:
            self.detail.image = img1
        case 2:
            self.detail.image = img2
        case 3:
            self.detail.image = img3
        case 0:
            self.detail.image = img3
        default:
            print("error")
            self.img_count = 1
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
