//
//  ViewController.swift
//  Day5
//
//  Created by Ethan on 2016/7/8.
//  Copyright © 2016年 Ethan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dateAndTimeLabel: UILabel!
    
    @IBAction func doRefresh(_ sender: AnyObject) {
        
        updateTime()
        
    }
    var timer: Timer?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 原本需要用refresh按鈕來更新時間，現在用timer就可以做到自行更新時間的效果
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.updateTime), userInfo: nil, repeats: true)
        
    }
    
    func updateTime() {
        
        // 先設定好要呈現時間的格式
        let dateFormate = DateFormatter()
        dateFormate.dateStyle = .full
        dateFormate.timeStyle = .medium
        
        //加入下方內容，可以將時間的格式變成繁體中文
        dateFormate.locale = Locale(identifier: "zh-TW")
        
        // 將目前“時間”的物件提取出來
        let date = Date()
        
        //最後以時間的物件為參數，帶入時間格式的程式中
        dateAndTimeLabel.text = dateFormate.string(from: date)
        
    }

}

