//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 宇都宮 正暉 on 2018/03/10.
//  Copyright © 2018年 masaki.utsunomiya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainimage: UIImageView!

    @IBOutlet weak var nextbutton: UIButton!
    @IBOutlet weak var backbutton: UIButton!
    @IBOutlet weak var Mainbutton: UIButton!
    
    
    var timer: Timer!
    
    var img1 = UIImage(named:"img1.jpg")
    var img2 = UIImage(named:"img2.jpg")
    var img3 = UIImage(named:"img3.jpg")
    var img_count = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
            mainimage.image = img1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func choise_img() {
        switch self.img_count {
        case 1:
            self.mainimage.image = img1
        case 2:
            self.mainimage.image = img2
        case 3:
            self.mainimage.image = img3
        default:
            print("error")
            self.img_count = 1
        }
    }
    
    @objc func slideImg(timer: Timer) {
        if self.img_count == 3 {
            self.img_count = 1
        } else{
            self.img_count += 1
        }
        choise_img()
    }

    @IBAction func startbutton(_ sender: Any) {
        if self.Mainbutton.currentTitle == "再生" {
            if self.timer == nil {
                self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(slideImg), userInfo: nil, repeats: true)
                self.Mainbutton.setTitle("停止", for: .normal)
                self.nextbutton.isEnabled = false
                self.nextbutton.setTitleColor(UIColor.gray, for: .normal)
                self.backbutton.isEnabled = false
                self.backbutton.setTitleColor(UIColor.gray, for: .normal)
            }
        } else if self.Mainbutton.currentTitle == "停止" {
            if self.timer != nil {
                self.timer.invalidate()
                self.timer = nil
                self.Mainbutton.setTitle("再生", for: .normal)
                self.nextbutton.isEnabled = true
                self.nextbutton.setTitleColor(UIColor.black, for: .normal)
                self.backbutton.isEnabled = true
                self.backbutton.setTitleColor(UIColor.black, for: .normal)
            }
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let imgdetailViewController:ImgdetailViewController = segue.destination as! ImgdetailViewController
        imgdetailViewController.img_count = self.img_count
        if self.timer != nil {
            self.timer.invalidate()
            self.timer = nil
            self.Mainbutton.setTitle("再生", for: .normal)
            self.nextbutton.isEnabled = true
            self.nextbutton.setTitleColor(UIColor.black, for: .normal)
            self.backbutton.isEnabled = true
            self.backbutton.setTitleColor(UIColor.black, for: .normal)
        }
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        // 他の画面から segue を使って戻ってきた時に呼ばれる
        
    }
    
    @IBAction func next(_ sender: Any) {
        self.img_count += 1
        if self.img_count == 4 {
            self.img_count = 1
        }
        choise_img()
    }
    
    @IBAction func prev(_ sender: Any) {
        self.img_count -= 1
        if self.img_count == 0 {
            self.img_count = 3
        }
        choise_img()
    }
    
}
